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
    
    var creditsTextView:UITextView!
    var betTextView:UITextView!
    var paidTextView:UITextView!
    var creditsTitleLabel:UILabel!
    var betTitleLabel:UILabel!
    var paidTitleLabel:UILabel!
    
    var betOneButton:UIButton!
    var betMaxButton:UIButton!
    var spinButton:UIButton!
    
    var betOneLabel:UILabel!
    var betMaxLabel:UILabel!
    var spinLabel:UILabel!
    
    // Making CGFloat constant 
    // k stands for constant

    let kBottomHeight:CGFloat = 170/1136
    let kCardContainerHeight:CGFloat = 720/1136
    let kCardRows:CGFloat = 3
    let kCardColumns:CGFloat = 3
    
    
    let kGameResultsOffsetFromEdge:CGFloat = 40/640
    let kGameResultsOffsetFromEdge2:CGFloat = 260/640
    let kGameResultsOffsetFromEdge3:CGFloat = 480/640
    let kGameResultsOffsetFromEdgeTop:CGFloat = 17/1136
    let kGameResultsOffsetFromOtherView:CGFloat = 100/640
    let kGameResultsWidth:CGFloat = 120/640
    let kGameResultsHeight:CGFloat = 50/1136
    
    
    let kCardOffsetFromEdge:CGFloat = 40/640
    let kCardOffsetFromOtherCard:CGFloat = 55/640
    let kCardOffsetFromOtherCardTop:CGFloat = 10/1136
    let kCardWidth:CGFloat = 150/640
    let kCardHeight:CGFloat = 210/1136
    
    
    let kNumberOfContainers = 3
    let kNumberOfSlots = 3
    let kThird:CGFloat = 1.0/3.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kButtonOffsetfromEdge:CGFloat = 40/640
    let kButtonOffsetfromEdge2:CGFloat = 270/640
    let kButtonOffsetfromEdge3:CGFloat = 500/640
    let kButtonSize:CGFloat = 100/640
    let kButtonOffsetTop:CGFloat = 17/1136
    let kButtonLabelOffset:CGFloat = 20/1136
    
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
        self.setupBottomButtonContainer()
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
        // Text View Setup
        // Creits Text View Setup
        self.creditsTextView = UITextView()
        self.setUpGameTextView(self.creditsTextView)
        
        self.creditsTextView.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge), y: (self.view.frame.height * kGameResultsOffsetFromEdgeTop), width: (self.view.frame.width * kGameResultsWidth), height: (self.view.frame.height * kGameResultsHeight))
        self.gameResultsContainer.addSubview(self.creditsTextView)
        
        // Bet Text View Setup
        self.betTextView = UITextView()
        self.setUpGameTextView(self.betTextView)
        
        self.betTextView.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge2), y: (self.view.frame.height * kGameResultsOffsetFromEdgeTop), width: (self.view.frame.width * kGameResultsWidth), height: (self.view.frame.height * kGameResultsHeight))
        self.gameResultsContainer.addSubview(self.betTextView)
        
        // Paid Text View Setup
        self.paidTextView = UITextView()
        self.setUpGameTextView(self.paidTextView)
        
        self.paidTextView.frame = CGRect(x: (self.view.frame.width * kGameResultsOffsetFromEdge3), y: (self.view.frame.height * kGameResultsOffsetFromEdgeTop), width: (self.view.frame.width * kGameResultsWidth), height: (self.view.frame.height * kGameResultsHeight))
        self.gameResultsContainer.addSubview(self.paidTextView)
        
        // Label Setup
        // Credits Label Setup
        self.creditsTitleLabel = UILabel()
        self.setupGameLabel(self.creditsTitleLabel, gameLabelText: "Credits", color: navigationBarColor)
        self.creditsTitleLabel.center = CGPoint(x: ((creditsTextView.frame.width / 2) + creditsTextView.frame.origin.x), y: creditsTextView.frame.origin.y + (creditsTextView.frame.height * 1.3))
        gameResultsContainer.addSubview(self.creditsTitleLabel)
        
        // Bet Label Setup
        self.betTitleLabel = UILabel()
        self.setupGameLabel(self.betTitleLabel, gameLabelText: "Bet", color: navigationBarColor)
        self.betTitleLabel.center = CGPoint(x: ((betTextView.frame.width / 2) + betTextView.frame.origin.x), y: betTextView.frame.origin.y + (betTextView.frame.height * 1.3))
        gameResultsContainer.addSubview(self.betTitleLabel)

        // Paid Label Setup
        self.paidTitleLabel = UILabel()
        self.setupGameLabel(self.paidTitleLabel, gameLabelText: "Winner Paid", color: navigationBarColor)
        self.paidTitleLabel.center = CGPoint(x: ((paidTextView.frame.width / 2) + paidTextView.frame.origin.x), y: paidTextView.frame.origin.y + (paidTextView.frame.height * 1.3))
        gameResultsContainer.addSubview(self.paidTitleLabel)
    }
    
    func setupBottomButtonContainer() {
        self.betOneButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.betOneButton.frame = CGRectMake(self.view.frame.width * kButtonOffsetfromEdge,(self.view.frame.height * kButtonOffsetTop), self.view.frame.width * kButtonSize, self.view.frame.width * kButtonSize)
        // Button setup
        self.buttonSetup(self.betOneButton, image: "Bet One Button.png", target: "betOneButtonAction:")
        
        self.betMaxButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.betMaxButton.frame = CGRectMake(self.view.frame.width * kButtonOffsetfromEdge2, (self.view.frame.height * kButtonOffsetTop), self.view.frame.width * kButtonSize, self.view.frame.width * kButtonSize)
        // Button setup
        self.buttonSetup(self.betMaxButton, image: "Bet Max Button@2x.png", target: "betMaxButtonAction:")
        
        self.spinButton = UIButton.buttonWithType(UIButtonType.System) as UIButton
        self.spinButton.frame = CGRectMake(self.view.frame.width * kButtonOffsetfromEdge3, (self.view.frame.height * kButtonOffsetTop), self.view.frame.width * kButtonSize, self.view.frame.width * kButtonSize)
        // Button setup
        self.buttonSetup(self.spinButton, image: "Spin Button.png", target: "spinButtonAction:")

        self.betOneLabel = UILabel()
        self.setupGameLabel(self.betOneLabel, gameLabelText: "Bet One", color: titleColor)
        self.betOneLabel.center = CGPoint(x: (self.betOneButton.frame.origin.x + self.betOneButton.frame.width/2), y: self.betOneButton.frame.origin.y + self.betOneButton.frame.height + (self.view.frame.height * kButtonLabelOffset))
        
        self.betMaxLabel = UILabel()
        self.setupGameLabel(self.betMaxLabel, gameLabelText: "Bet Max", color: titleColor)
        self.betMaxLabel.center = CGPoint(x: (self.betMaxButton.frame.origin.x + self.betMaxButton.frame.width/2), y: self.betMaxButton.frame.origin.y + self.betMaxButton.frame.height + (self.view.frame.height * kButtonLabelOffset))
        
        self.spinLabel = UILabel()
        self.setupGameLabel(self.spinLabel, gameLabelText: "Spin", color: titleColor)
        self.spinLabel.center = CGPoint(x: (self.spinButton.frame.origin.x + self.spinButton.frame.width/2), y: self.spinButton.frame.origin.y + self.spinButton.frame.height + (self.view.frame.height * kButtonLabelOffset))
        
        self.bottomButtonContainer.addSubview(self.betOneButton)
        self.bottomButtonContainer.addSubview(self.betMaxButton)
        self.bottomButtonContainer.addSubview(self.spinButton)
        
        self.bottomButtonContainer.addSubview(self.betOneLabel)
        self.bottomButtonContainer.addSubview(self.betMaxLabel)
        self.bottomButtonContainer.addSubview(self.spinLabel)
        
        
        
    }
    
    override func motionEnded(motion: UIEventSubtype, withEvent event: UIEvent) {
        if(event.subtype == UIEventSubtype.MotionShake) {
            var alert = UIAlertController(title: "Reset",
                message: "Do you want to reset this game?",
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: {(action: UIAlertAction!) in
                // What happens when the user taps 'Ok'? That goes in here
            }))
            
            alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: {(action: UIAlertAction!) in
                // What happens when the user taps 'Cancel'? That goes in here
            }))
            
            alert.view.tintColor = navigationBarColor
            
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    // Helper function for Text View Setup
    func setUpGameTextView (textview: UITextView) {
        textview.selectable = false
        textview.layer.cornerRadius = 5.0
        textview.backgroundColor = UIColor.whiteColor()
        textview.layer.borderWidth = 0.5
        textview.layer.borderColor = (navigationBarColor).CGColor
        
        textview.text = "000000"
        textview.textColor = navigationBarColor
        textview.font = UIFont(name: "Menlo-Bold", size: 14)
        textview.textAlignment = NSTextAlignment.Center
    }
    
    // Helper function for Label Setup
    func setupGameLabel (gameLabel: UILabel, gameLabelText: String, color: UIColor) {
        gameLabel.text = "\(gameLabelText)"
        gameLabel.textColor = color
        gameLabel.font = UIFont.preferredFontForTextStyle(UIFontTextStyleCaption1)
        gameLabel.sizeToFit()
    }

    // Helper function for Button Setup
    func buttonSetup(button:UIButton, image:String, target:Selector) {
        button.setImage(UIImage(named: "\(image)"), forState: UIControlState.Normal)
        //        self.betOneButton.setTitle("Test Button", forState: UIControlState.Normal)
        button.addTarget(self, action: target, forControlEvents: UIControlEvents.TouchUpInside)
        button.tintColor = titleColor
    }
    
    func betOneButtonAction(sender:UIButton!) {
        println("Button 1 tapped")
    }
    
    func betMaxButtonAction(sender:UIButton!)
    {
        println("Button 2 tapped")
    }
    
    func spinButtonAction(sender:UIButton!)
    {
        println("Button 3 tapped")
    }
}

