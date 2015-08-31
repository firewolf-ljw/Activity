//
//  MyActivityView.swift
//  Activity
//
//  Created by  lifirewolf on 15/8/3.
//  Copyright (c) 2015年  lifirewolf. All rights reserved.
//

import UIKit

class MyPopContentView: UIView {
    
    struct PopProperties {
        static let cvcNibName: String = "MyCollectionViewCell"
        static let cvcIdentifier: String = "mycvc"
        static let cvcWidth: CGFloat = 80
        static let cvcHeight: CGFloat = 95
        static let cvsEdgeWidth: CGFloat = 10.0
        static let cvsEdgeInsets: UIEdgeInsets = UIEdgeInsets(top: cvsEdgeWidth, left: cvsEdgeWidth, bottom: cvsEdgeWidth, right: cvsEdgeWidth)
    }
    
    var cellItems: [MyCellItem]! {
        didSet {
            self.collectionView.reloadData()
        }
    }
    
    @IBOutlet weak var title: UILabel!
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet {
            self.collectionView.backgroundColor = UIColor.clearColor()
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            
            self.collectionView.registerNib(UINib(nibName: PopProperties.cvcNibName, bundle: nil), forCellWithReuseIdentifier: PopProperties.cvcIdentifier)
            
        }
    }
    
    @IBOutlet weak var cancleBtn: UIButton! {
        didSet {
            self.cancleBtn.addTarget(self, action: "closePop:", forControlEvents: UIControlEvents.TouchUpInside)
        }
    }
    
    var baseHight: CGFloat {
        return title.bounds.height + cancleBtn.bounds.height + PopProperties.cvsEdgeWidth * 3 + PopProperties.cvcHeight * 2
    }
    
    func closePop(sender: UIButton) {
        if let popView = self.superview as? MyPopoverView {
            popView.tappedCancel()
        }
    }
    
}

extension MyPopContentView: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        let item = cellItems[indexPath.row]
        item.action()
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: PopProperties.cvcWidth, height: PopProperties.cvcHeight)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            return PopProperties.cvsEdgeInsets
    }
    
}

extension MyPopContentView: UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.cellItems.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell: MyCollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier(PopProperties.cvcIdentifier, forIndexPath: indexPath) as! MyCollectionViewCell
        
        cell.item = cellItems[indexPath.row]

        return cell
    }
}