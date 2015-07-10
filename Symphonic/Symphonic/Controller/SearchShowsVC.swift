//
//  SearchShowsVC.swift
//  Symphonic
//
//  Created by Evan Rosenfeld on 7/9/15.
//  Copyright (c) 2015 Avocado Hills. All rights reserved.
//

import UIKit

class SearchShowsVC: UICollectionViewController {
    private let kShowCellIdentifier = "showGridIdentifier"
    private let insets = UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0)

    private var shows = [Show]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.registerNib(UINib(nibName: "showCell", bundle: nil), forCellWithReuseIdentifier: kShowCellIdentifier)

        shows = Show.getShowList(forDate: NSDate(dateFromString: "2015-12-02"), withType: Type.Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func filterPressed(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

        let filterVC = storyboard.instantiateViewControllerWithIdentifier("filterVC") as! FilterShowsVC
        filterVC.delegate = self
//        (filterNavVC.topViewController as FilterShowsVC).delegate = self

        self.presentViewController(filterVC, animated: true, completion: nil)
    }
}

extension SearchShowsVC: UICollectionViewDataSource {
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return shows.count
    }

    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
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
        shows = Show.getShowList(forDate: NSDate(dateFromString: "2015-12-02"), withType: Type.Any)
        collectionView!.reloadData()
    }
}

protocol SearchFiltering: class {
    func didEndSelectingFilter(#date: NSDate, type: Type)
}