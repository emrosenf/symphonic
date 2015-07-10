//
//  SearchShowsVC.swift
//  Symphonic
//
//  Created by Evan Rosenfeld on 7/9/15.
//  Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import UIKit

class SearchShowsVC: UIViewController {
    @IBOutlet weak var showCollectionView: UICollectionView!
    @IBOutlet weak var collectionConstraintToTopGuide: NSLayoutConstraint!
    @IBOutlet weak var dateFilterLabel: UILabel!
    @IBOutlet weak var typeFilterLabel: UILabel!
    
    private let kShowCellIdentifier = "showGridIdentifier"
    private let insets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    private var shows = [Show]()

    override func viewDidLoad() {
        super.viewDidLoad()

        showCollectionView.registerNib(UINib(nibName: "showCell", bundle: nil), forCellWithReuseIdentifier: kShowCellIdentifier)

        // Filter info view is initially hidden
        self.collectionConstraintToTopGuide.constant = -52
        
        shows = Show.getShowList()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func filterPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let filterNavVC = storyboard.instantiateViewControllerWithIdentifier("filterNavVC") as! UINavigationController
        (filterNavVC.topViewController as! FilterShowsVC).delegate = self

        self.presentViewController(filterNavVC, animated: true, completion: nil)
    }
 
    @IBAction func clearFilter(sender: AnyObject) {
        UIView.animateWithDuration(Double(0.3), animations: {
            // hide filter info view
            self.collectionConstraintToTopGuide.constant = -52
            self.view.layoutIfNeeded()
        })

        shows = Show.getShowList()
        showCollectionView.reloadData()
    }
    
}

extension SearchShowsVC: UICollectionViewDataSource {
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(kShowCellIdentifier, forIndexPath: indexPath) as! showCellView

        cell.showImage.image = UIImage(named: shows[indexPath.row].imageName)
        cell.showTitle.text  = shows[indexPath.row].name

        return cell
    }
}

extension SearchShowsVC : UICollectionViewDelegateFlowLayout {
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        let cellWidth  = (collectionView.frame.width - 3*insets.left)/2
        return CGSize(width: cellWidth, height: cellWidth)
    }

    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        return insets
    }
}

extension SearchShowsVC: SearchFiltering {
    func didEndSelectingFilter(#date: NSDate, type: Type) {
        let dateStringFormatter = NSDateFormatter()
        dateStringFormatter.dateFormat = "d MMM"
        dateStringFormatter.locale = NSLocale(localeIdentifier: "en_US_POSIX")
        let strRepr = dateStringFormatter.stringFromDate(date)
        dateFilterLabel.text = "Date: " + strRepr

        typeFilterLabel.text = "Type: " + type.getTextRepr()

        UIView.animateWithDuration(Double(0.3), animations: {
            // hide filter info view
            self.collectionConstraintToTopGuide.constant = 0
            self.view.layoutIfNeeded()
        })

        shows = Show.getShowList(forDate: date, withType: type)
        showCollectionView.reloadData()
    }
}

protocol SearchFiltering: class {
    func didEndSelectingFilter(#date: NSDate, type: Type)
}