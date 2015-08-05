//
//  MyCollectionViewCell.swift
//  Activity
//
//  Created by  lifirewolf on 15/8/3.
//  Copyright (c) 2015年  lifirewolf. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {

    var item: MyCellItem! {
        didSet {
            self.image.image = UIImage(named: self.item.image)
            self.subject.text = self.item.subject
        }
    }
    
    @IBOutlet weak var image: UIImageView!
    
    @IBOutlet weak var subject: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = UIColor.clearColor()
    }

}

typealias cellItemAction = () -> Void

class MyCellItem {
    
    let image: String
    let subject: String
    let action: cellItemAction
    
    init(image: String, subject: String, action: cellItemAction) {
        self.image = image
        self.subject = subject
        self.action = action
    }
    
}