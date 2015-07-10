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

    
    var shows = [Show]()

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView?.registerNib(UINib(nibName: "showCell", bundle: nil), forCellWithReuseIdentifier: kShowCellIdentifier)

        shows = Show.getShowList(forDate: NSDate(dateFromString: "2015-12-02"), withType: Type.Any)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
