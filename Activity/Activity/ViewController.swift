//
//  ViewController.swift
//  Activity
//
//  Created by  lifirewolf on 15/7/21.
//  Copyright (c) 2015年  lifirewolf. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func share(sender: UIButton) {
        
        let items = [
            MyCellItem(image: "icon_1.png", subject: "icon_1", action: { println("click icon_1") }),
            MyCellItem(image: "icon_2.png", subject: "icon_2", action: { println("click icon_2") }),
            MyCellItem(image: "icon_3.png", subject: "icon_3", action: { println("click icon_3") }),
            MyCellItem(image: "icon_4.png", subject: "icon_4", action: { println("click icon_4") }),
            MyCellItem(image: "icon_5.png", subject: "icon_5", action: { println("click icon_5") }),
            MyCellItem(image: "icon_1.png", subject: "icon_1", action: { println("click icon_1") }),
            MyCellItem(image: "icon_2.png", subject: "icon_2", action: { println("click icon_2") }),
            MyCellItem(image: "icon_3.png", subject: "icon_3", action: { println("click icon_3") }),
            MyCellItem(image: "icon_4.png", subject: "icon_4", action: { println("click icon_4") }),
            MyCellItem(image: "icon_5.png", subject: "icon_5", action: { println("click icon_5") }),
            MyCellItem(image: "icon_1.png", subject: "icon_1", action: { println("click icon_1") }),
            MyCellItem(image: "icon_2.png", subject: "icon_2", action: { println("click icon_2") }),
            MyCellItem(image: "icon_3.png", subject: "icon_3", action: { println("click icon_3") }),
            MyCellItem(image: "icon_4.png", subject: "icon_4", action: { println("click icon_4") }),
            MyCellItem(image: "icon_5.png", subject: "icon_5", action: { println("click icon_5") })
        ]
        
        popView = MyPopoverView(items: items)
//        popView?.show(self.view)
        popView?.show(UIApplication.sharedApplication().windows.last as! UIView)
        
    }
    
    var popView: MyPopoverView?
    
    override func willAnimateRotationToInterfaceOrientation(toInterfaceOrientation: UIInterfaceOrientation, duration: NSTimeInterval) {
        
        popView?.resetBlankView()
        
        switch (toInterfaceOrientation) {
        case .Portrait:
            println("home健在下")
        case .PortraitUpsideDown:
            println("home健在上")
        case .LandscapeLeft:
            println("home健在左")
        case .LandscapeRight:
            println("home健在右")
        default:
            break
        }
    }
}

