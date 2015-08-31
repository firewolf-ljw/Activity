//
//  MyActivityViewController.swift
//  Activity
//
//  Created by  lifirewolf on 15/8/4.
//  Copyright (c) 2015年  lifirewolf. All rights reserved.
//

import UIKit

class MyPopoverView: UIView {
    
    struct PopProperties {
        static let popViewWidth: CGFloat = 500
        static let popViewHeight: CGFloat = 500
        static let blankViewColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.2)
        static let contentViewColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.6)
    }
    
    var blankView: UIView!
    var contentView: MyPopContentView!
    
    init(items: [MyCellItem]) {
        
        super.init(frame: CGRectMake(0, 0, UIScreen.width, UIScreen.height))
        
        self.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleHeight
        
        let array = NSBundle.mainBundle().loadNibNamed("MyPopContentView", owner: nil, options: nil)
        self.contentView = array.last as! MyPopContentView
        self.contentView.backgroundColor = PopProperties.contentViewColor
        self.contentView.autoresizingMask = UIViewAutoresizing.FlexibleWidth | UIViewAutoresizing.FlexibleTopMargin | UIViewAutoresizing.FlexibleLeftMargin | UIViewAutoresizing.FlexibleRightMargin
        
        self.contentView.cellItems = items
        
        if AppDelegate.isPad {
            
            let x = (self.frame.width - PopProperties.popViewWidth) / 2
            let y = (self.frame.height - PopProperties.popViewHeight) / 2
            self.contentView.frame = CGRectMake(x, y, PopProperties.popViewWidth, PopProperties.popViewHeight)
            self.contentView.backgroundColor = PopProperties.blankViewColor
                
            self.addSubview(self.contentView)
            
        } else {
            
            self.backgroundColor = PopProperties.blankViewColor
            
            self.contentView.frame = CGRectMake(0, self.frame.height - self.contentView.baseHight, self.frame.width, self.contentView.baseHight)
            
            self.blankView = UIView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height - self.contentView.baseHight))
            self.blankView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: "tappedCancel"))
            
            self.addSubview(self.blankView)
            self.addSubview(self.contentView)
        }
        
    }

    func show(view: UIView) {
        
        self.frame = CGRectMake(0, UIScreen.height, UIScreen.width, 0)
        self.alpha = 0
        
        UIView.beginAnimations(nil, context:nil)
        
        view.addSubview(self)
        
        self.frame = CGRectMake(0, 0, UIScreen.width, UIScreen.height)
        self.alpha = 1
        
        UIView.commitAnimations()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tappedCancel() {
        
        UIView.animateWithDuration(0.3,
            animations: {
                self.frame = CGRectMake(0, UIScreen.height, UIScreen.width, 0)
                self.alpha = 0
            },
            completion: {finished -> Void in
                if finished {
                    self.removeFromSuperview()
                }
            }
        )
    }
    
    func resetBlankView() {
        if AppDelegate.isPad {
            let x = (self.frame.width - PopProperties.popViewWidth) / 2
            let y = (self.frame.height - PopProperties.popViewHeight) / 2
            self.contentView.frame = CGRectMake(x, y, PopProperties.popViewWidth, PopProperties.popViewHeight)
        } else {
            self.blankView.frame = CGRectMake(0, 0, self.frame.width, self.frame.height - self.contentView.baseHight)
        }
    }

}