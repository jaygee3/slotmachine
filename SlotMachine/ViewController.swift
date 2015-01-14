//
//  ViewController.swift
//  SlotMachine
//
//  Created by John S. Goodson on 1/12/15.
//  Copyright (c) 2015 John S. Goodson. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    // Information Labels
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel: UILabel!
    
    // Fourth Container Buttons
    var resetButton: UIButton!
    var betOneButton: UIButton!
    var betMaxButton: UIButton!
    var spinButton: UIButton!
    
    // Slots Array
    var slots: [[Slot]] = []
    
    let kMarginForView:CGFloat = 10.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kEighth:CGFloat = 1.0/8.0
    let kHalf:CGFloat = 1.0/2.0
    
    let kNumberofContainer = 3
    let kNumberofSlots = 3
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupContainerViews()
        setupFirstContainer(self.firstContainer)
        setupSecondContainer(self.secondContainer)
        setupThirdContainer(self.thirdContainer)
        setupFourthContainer(self.fourthContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IBActions
    func resetButtonPressed (button: UIButton) {
        println("resetButtonPressed")
    }
    func betOneButtonPressed (button: UIButton) {
        println("betOneButtonPressed")
    }
    func betMaxButtonPressed (button:UIButton) {
        println("betMaxButtonPressed")
    }
    func spinButtonPressed (button:UIButton) {
        slots = Factory.createSlots()
        setupSecondContainer(self.secondContainer)
    }

    
    
    func setupContainerViews () {
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.firstContainer.backgroundColor = UIColor.redColor()
        self.view.addSubview(self.firstContainer)
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.purpleColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.greenColor()
        self.view.addSubview(self.thirdContainer)
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.yellowColor()
        self.view.addSubview(self.fourthContainer)
        
    }
    
    func setupFirstContainer(containerView: UIView) {
        self.titleLabel = UILabel()
        self.titleLabel.text = "ULTRA SLOTS"
        self.titleLabel.textColor = UIColor.blackColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        self.titleLabel.backgroundColor = UIColor.yellowColor()
        containerView.addSubview(self.titleLabel)
    }
    
    func setupSecondContainer(containerView: UIView) {
        for var containerNumber = 0; containerNumber < kNumberofContainer; ++containerNumber {
            
            for var slotNumber = 0; slotNumber < kNumberofSlots; ++slotNumber {
                
                var slot:Slot
                var slotImageView = UIImageView ()
                if slots.count != 0 {
                    let slotContainer = slots[containerNumber]
                    slot = slotContainer[slotNumber]
                    slotImageView.image = slot.image
                }
                else {
                    slotImageView.image = UIImage(named: "Ace")
                }
                
                
                
                slotImageView.backgroundColor = UIColor.blueColor()
                
                slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird), y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird), width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
                }
        
        }
    }
    
    func setupThirdContainer(containerView: UIView) {
        
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.magentaColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center
        self.creditsLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.magentaColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()
        self.winnerPaidLabel.text = "000000"
        self.winnerPaidLabel.textColor = UIColor.magentaColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "CREDITS"
        self.creditsTitleLabel.textColor = UIColor.magentaColor()
        self.creditsTitleLabel.font = UIFont(name: "Menlo-Bold", size: 18)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 1.5)
        self.creditsTitleLabel.textAlignment = NSTextAlignment.Center
        self.creditsTitleLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "BET"
        self.betTitleLabel.textColor = UIColor.magentaColor()
        self.betTitleLabel.font = UIFont(name: "Menlo-Bold", size: 18)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 1.5)
        self.betTitleLabel.textAlignment = NSTextAlignment.Center
        self.betTitleLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.betTitleLabel)
        
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "WINNINGS"
        self.winnerPaidTitleLabel.textColor = UIColor.magentaColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "Menlo-Bold", size: 18)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 1.5)
        self.winnerPaidTitleLabel.textAlignment = NSTextAlignment.Center
        self.winnerPaidTitleLabel.backgroundColor = UIColor.blackColor()
        containerView.addSubview(self.winnerPaidTitleLabel)
    }
    
    func setupFourthContainer(containerView: UIView) {
        self.resetButton = UIButton()
        self.resetButton.setTitle("RESET", forState: UIControlState.Normal)
        self.resetButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.resetButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.resetButton.backgroundColor = UIColor.greenColor()
        self.resetButton.sizeToFit()
        self.resetButton.center = CGPoint(x: containerView.frame.width * kEighth, y: containerView.frame.height * kHalf)
        self.resetButton.addTarget(self, action: "resetButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.resetButton)
        
        self.betOneButton = UIButton()
        self.betOneButton.setTitle("BET 1", forState: UIControlState.Normal)
        self.betOneButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.betOneButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.betOneButton.backgroundColor = UIColor.greenColor()
        self.betOneButton.sizeToFit()
        self.betOneButton.center = CGPoint(x: containerView.frame.width * kEighth * 3, y: containerView.frame.height * kHalf)
        self.betOneButton.addTarget(self, action: "betOneButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betOneButton)
        
        self.betMaxButton = UIButton()
        self.betMaxButton.setTitle("BET MAX", forState: UIControlState.Normal)
        self.betMaxButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.betMaxButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.betMaxButton.backgroundColor = UIColor.greenColor()
        self.betMaxButton.sizeToFit()
        self.betMaxButton.center = CGPoint(x: containerView.frame.width * kEighth * 5, y: containerView.frame.height * kHalf)
        self.betMaxButton.addTarget(self, action: "betMaxButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.betMaxButton)

        self.spinButton = UIButton()
        self.spinButton.setTitle("SPIN", forState: UIControlState.Normal)
        self.spinButton.setTitleColor(UIColor.redColor(), forState: UIControlState.Normal)
        self.spinButton.titleLabel?.font = UIFont(name: "Superclarendon-Bold", size: 14)
        self.spinButton.backgroundColor = UIColor.greenColor()
        self.spinButton.sizeToFit()
        self.spinButton.center = CGPoint(x: containerView.frame.width * kEighth * 7, y: containerView.frame.height * kHalf)
        self.spinButton.addTarget(self, action: "spinButtonPressed:", forControlEvents: UIControlEvents.TouchUpInside)
        containerView.addSubview(self.spinButton)
        
    }

}

