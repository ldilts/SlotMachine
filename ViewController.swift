//
//  ViewController.swift
//  SlotMachine
//
//  Created by Lucas Michael Dilts on 10/13/14.
//  Copyright (c) 2014 Lucas Dilts. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    // Making CGFloat constant 
    // k stands for constant
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kBottom:CGFloat = 966/1136
    let kBottomHeight:CGFloat = 170/1136
    
    let backgroundColor = UIColor(hex: 0xFCF2D9)
    let titleColor = UIColor(hex: 0xFAD961)
    let navigationBarColor = UIColor(hex: 0xD85637)


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Super Slots"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: titleColor, NSFontAttributeName: UIFont(name: "Streetwear", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        
//        println("\(self.navigationController?.navigationBar.frame.height)")
//    
        var barHeight = self.navigationController?.topLayoutGuide.length
        
        var aux:CGFloat = barHeight!
        
        setupContainerViews()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.navigationController?.navigationBar.setNeedsLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func setupContainerViews()  {
        
        let navigationBarHeight: CGFloat = (self.navigationController?.navigationBar.bounds.height)!
        let statusBarHeight: CGFloat = (self.navigationController?.topLayoutGuide.length)!
    
        self.view.backgroundColor = backgroundColor
        
//        self.firstContainer = UIView(frame: CGRect(x: 0, y: self.view.frame.height - navigationBarHeight - statusBarHeight - (self.view.frame.height * kBottomHeight), width: self.view.frame.width, height: self.view.frame.height * kBottomHeight))
//        self.firstContainer.backgroundColor = navigationBarColor
//        self.view.addSubview(self.firstContainer)
        
        self.firstContainer = UIView(frame: CGRect(x: 0, y: self.view.frame.height - navigationBarHeight - statusBarHeight - (self.view.frame.height * kBottomHeight), width: self.view.frame.width, height: self.view.frame.height * kBottomHeight))
        self.firstContainer.backgroundColor = navigationBarColor
        self.view.addSubview(self.firstContainer)
        
    }

}

