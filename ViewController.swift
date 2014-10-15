//
//  ViewController.swift
//  SlotMachine
//
//  Created by Lucas Michael Dilts on 10/13/14.
//  Copyright (c) 2014 Lucas Dilts. All rights reserved.
//

import UIKit
import QuartzCore

class ViewController: UIViewController {
    
    var bottomButtonContainer: UIView!
    var cardContainer: UIView!
    var gameResultsContainer: UIView!
    var divideContainer: UIView!
    
    var creditsLabel:UITextView!
    var betLabel:UITextView!
    var paidLabel:UITextView!
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var paidTitleLabel:UILabel!
    
    
    // Making CGFloat constant 
    // k stands for constant
//    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
//    let kBottom:CGFloat = 966/1136
    let kBottomHeight:CGFloat = 170/1136
    let kCardContainerHeight:CGFloat = 720/1136
    let kCardRows:CGFloat = 3
    let kCardColumns:CGFloat = 3
    
    
    let kGameResultsOffsetFromEdge:CGFloat = 40/640
    let kGameResultsOffsetFromEdge2:CGFloat = 260/640
    let kGameResultsOffsetFromEdge3:CGFloat = 480/640
    let kGameResultsOffsetFromEdgeTop:CGFloat = 16/1136
    let kGameResultsOffsetFromOtherView:CGFloat = 100/640
    
    
    let kCardOffsetFromEdge:CGFloat = 40/640
    let kCardOffsetFromOtherCard:CGFloat = 55/640
    let kCardOffsetFromOtherCardTop:CGFloat = 10/1136
    
    let kCardWidth:CGFloat = 150/640
    let kCardHeight:CGFloat = 210/1136
    
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    let kThird:CGFloat = 1.0/3.0
    let kMarginForSlot:CGFloat = 2.0
    
    let backgroundColor = UIColor(hex: 0xFCF2D9)
    let titleColor = UIColor(hex: 0xFAD961)
    let navigationBarColor = UIColor(hex: 0xD85637)


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.title = "Super Slots"
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: titleColor, NSFontAttributeName: UIFont(name: "Streetwear", size: 24)]
        self.navigationController?.navigationBar.titleTextAttributes = titleDict
        
        self.view.backgroundColor = backgroundColor
        self
        
        setupContainerViews()
        self.setupCardContainer(cardContainer)
        self.setupGameResultsContainer()
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
        
        self.cardContainer = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: self.view.frame.width, height: self.view.frame.height * kCardContainerHeight))
//        self.cardContainer.backgroundColor = UIColor.blueColor()
        self.view.addSubview(self.cardContainer)
        
        self.bottomButtonContainer = UIView(frame: CGRect(x: 0, y: self.view.frame.height - navigationBarHeight - statusBarHeight - (self.view.frame.height * kBottomHeight), width: self.view.frame.width, height: self.view.frame.height * kBottomHeight))
        self.bottomButtonContainer.backgroundColor = navigationBarColor
        self.view.addSubview(self.bottomButtonContainer)
        
        self.gameResultsContainer = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.cardContainer.frame.height, width: self.view.frame.width, height: self.view.frame.height - self.cardContainer.frame.height - self.bottomButtonContainer.frame.height - navigationBarHeight - statusBarHeight))
//        self.gameResultsContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.gameResultsContainer)
        
        self.divideContainer = UIView(frame: CGRect(x: self.view.frame.origin.x, y: self.cardContainer.frame.height, width: self.view.frame.width, height: 0.5))
        self.divideContainer.backgroundColor = navigationBarColor
        self.view.addSubview(self.divideContainer)
        
    }
    
    func setupCardContainer(containerView: UIView) {
        
        let cardWidth:CGFloat = self.view.frame.width * kCardWidth
        let cardHeight:CGFloat = self.view.frame.height * kCardHeight
        let edgeOffset:CGFloat = self.view.frame.width * kCardOffsetFromEdge
        let offsetFromOtherCard:CGFloat = self.view.frame.width * kCardOffsetFromOtherCard
        let offsetFromOtherCardTop:CGFloat = self.view.frame.height * kCardOffsetFromOtherCardTop
        
        for var i:CGFloat = 0; i < kCardRows; i++ {
            for var j:CGFloat = 0; j < kCardColumns; j++ {
                var cardImageView = UIImageView()
                cardImageView.layer.cornerRadius = 5.0
                cardImageView.layer.masksToBounds = true
                
                cardImageView.layer.borderWidth = 0.5
                cardImageView.layer.borderColor = (navigationBarColor).CGColor
//                cardImageView.layer.shadowOffset = CGSizeMake(0, 0);
//                cardImageView.layer.shadowOpacity = 0.8;
//                cardImageView.layer.shadowRadius = 5.0;
//                cardImageView.backgroundColor = UIColor.blueColor()

                switch i {
                    case 0:
                        cardImageView.frame = CGRect(x: edgeOffset, y: edgeOffset + (j * cardHeight) + (j * offsetFromOtherCardTop), width: cardWidth, height: cardHeight)
                    case 1:
                        cardImageView.frame = CGRect(x: edgeOffset + cardWidth + offsetFromOtherCard, y: edgeOffset + (j * cardHeight) + (j * offsetFromOtherCardTop), width: cardWidth, height: cardHeight)
                    case 2:
                        cardImageView.frame = CGRect(x: edgeOffset + cardWidth + offsetFromOtherCard + cardWidth + offsetFromOtherCard, y: edgeOffset + (j * cardHeight) + (j * offsetFromOtherCardTop), width: cardWidth, height: cardHeight)
                    default:
                        cardImageView.frame = CGRect(x: 0, y: 0, width: cardWidth, height: cardHeight)
                }
                self.cardContainer.addSubview(cardImageView)
            }
        }
    }
    
    func setupGameResultsContainer () {
        self.creditsLabel = UITextView()
        self.creditsLabel.layer.cornerRadius = 5.0
        self.creditsLabel.backgroundColor = UIColor.whiteColor()
        self.creditsLabel.layer.borderWidth = 0.5
        self.creditsLabel.layer.borderColor = (navigationBarColor).CGColor
        
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = navigationBarColor
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 14)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        
        self.creditsLabel.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge), y: (self.view.frame.width * kGameResultsOffsetFromEdgeTop), width: 60, height: 25)
//        self.creditsLabel.sizeToFit()
        
//        self.creditsLabel.center = CGPoint(x: (self.view.frame.width * kGameResultsCenterOffsetFromEdge), y: (self.view.frame.height * kGameResultsCenterOffsetFromEdgeTop))
        self.gameResultsContainer.addSubview(self.creditsLabel)
        

        self.betLabel = UITextView()
        self.betLabel.layer.cornerRadius = 5.0
        self.betLabel.backgroundColor = UIColor.whiteColor()
        self.betLabel.layer.borderWidth = 0.5
        self.betLabel.layer.borderColor = (navigationBarColor).CGColor
        
        self.betLabel.text = "000000"
        self.betLabel.textColor = navigationBarColor
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 14)
        self.betLabel.textAlignment = NSTextAlignment.Center
//        self.betLabel.sizeToFit()
        
//        self.betLabel.center = CGPoint(x: (self.view.frame.width * kGameResultsOffsetFromEdge2), y: (self.view.frame.width * kGameResultsOffsetFromEdgeTop))
        self.betLabel.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge2), y: (self.view.frame.width * kGameResultsOffsetFromEdgeTop), width: 60, height: 25)
        self.gameResultsContainer.addSubview(self.betLabel)
        
        
        self.paidLabel = UITextView()
        self.paidLabel.layer.cornerRadius = 5.0
        self.paidLabel.backgroundColor = UIColor.whiteColor()
        self.paidLabel.layer.borderWidth = 0.5
        self.paidLabel.layer.borderColor = (navigationBarColor).CGColor
        
        self.paidLabel.text = "000000"
        self.paidLabel.textColor = navigationBarColor
        self.paidLabel.font = UIFont(name: "Menlo-Bold", size: 14)
        self.paidLabel.textAlignment = NSTextAlignment.Center
//        self.paidLabel.sizeToFit()
        
//        self.paidLabel.center = CGPoint(x: (self.view.frame.width * kGameResultsOffsetFromEdge3), y: (self.view.frame.width * kGameResultsOffsetFromEdgeTop))
        self.paidLabel.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge3), y: (self.view.frame.width * kGameResultsOffsetFromEdgeTop), width: 60, height: 25)
        self.gameResultsContainer.addSubview(self.paidLabel)
    }

}

