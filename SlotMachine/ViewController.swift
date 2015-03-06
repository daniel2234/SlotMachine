//
//  ViewController.swift
//  SlotMachine
//
//  Created by Daniel Kwiatkowski on 2015-02-19.
//  Copyright (c) 2015 Daniel Kwiatkowski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var firstContainer: UIView!
    var secondContainer: UIView!
    var thirdContainer: UIView!
    var fourthContainer: UIView!
    
    var titleLabel: UILabel!
    
    //Information Labels
    
    var creditsLabel: UILabel!
    var betLabel: UILabel!
    var winnerPaidLabel: UILabel!
    var creditsTitleLabel: UILabel!
    var betTitleLabel: UILabel!
    var winnerPaidTitleLabel:UILabel!
    
    let kMarginForView:CGFloat = 10.0
    let kSixth:CGFloat = 1.0/6.0
    let kThird:CGFloat = 1.0/3.0
    let kMarginForSlot:CGFloat = 2.0
    
    let kNumberofContainers = 3
    let kNumberofSlots = 3
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.SetupContainerViews()
        self.setupFirstContainer(self.firstContainer)
        self.setupSecondContainer(self.secondContainer)
        self.setupThirdContainer(self.thirdContainer)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    //setup different containers
    func SetupContainerViews() {
        self.firstContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: self.view.bounds.origin.y, width: self.view.bounds.width - (kMarginForView * 2) , height: self.view.bounds.height * kSixth)) //container that has that has a border of 10 on each side , and it draws a rectangle 1/6th of the entire UIView.
        self.firstContainer.backgroundColor = UIColor.redColor()// gives it a red background
        self.view.addSubview(self.firstContainer) // adding the container form the superView
        
        self.secondContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y:firstContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * (3 * kSixth)))
        self.secondContainer.backgroundColor = UIColor.blackColor()
        self.view.addSubview(self.secondContainer)
        
        self.thirdContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.thirdContainer.backgroundColor = UIColor.lightGrayColor()
        self.view.addSubview(self.thirdContainer)
        
        
        self.fourthContainer = UIView(frame: CGRect(x: self.view.bounds.origin.x + kMarginForView, y: firstContainer.frame.height + secondContainer.frame.height + thirdContainer.frame.height, width: self.view.bounds.width - (kMarginForView * 2), height: self.view.bounds.height * kSixth))
        self.fourthContainer.backgroundColor = UIColor.blackColor()//blackColor()
        self.view.addSubview(self.fourthContainer)
    }
    //setup helper function to setup the title
    func setupFirstContainer(containerView: UIView){
        self.titleLabel = UILabel()
        self.titleLabel.text = "Super Slots"
        self.titleLabel.textColor = UIColor.yellowColor()
        self.titleLabel.font = UIFont(name: "MarkerFelt-Wide", size: 40)
        self.titleLabel.sizeToFit()
        self.titleLabel.center = containerView.center
        containerView.addSubview(self.titleLabel)
    }
    
    //setup helper function to setup 9 different image slots for cards
    func setupSecondContainer(containerView: UIView){
        for var containerNumber = 0; containerNumber < kNumberofContainers; ++containerNumber {
            for var slotNumber = 0; slotNumber < kNumberofSlots; ++slotNumber {
            var slotImageView = UIImageView()
            slotImageView.backgroundColor = UIColor.yellowColor()
            
            slotImageView.frame = CGRect(x: containerView.bounds.origin.x + (containerView.bounds.size.width * CGFloat(containerNumber) * kThird) + kMarginForSlot , y: containerView.bounds.origin.y + (containerView.bounds.size.height * CGFloat(slotNumber) * kThird) + kMarginForSlot, width: containerView.bounds.width * kThird - kMarginForSlot, height: containerView.bounds.height * kThird - kMarginForSlot)
                containerView.addSubview(slotImageView)
                
//            var labelSlot = UILabel()
//            labelSlot.text = "C\(containerNumber)S\(slotNumber)"
//            labelSlot.textColor = UIColor.blackColor()
//            labelSlot.sizeToFit()
//            labelSlot.center.x = CGFloat(slotImageView.bounds.width / 2.0);
//            labelSlot.center.y = CGFloat(slotImageView.bounds.height / 2.0);
//            slotImageView.addSubview(labelSlot)
//            containerView.addSubview(slotImageView)
            
            }
        }
    }
    func setupThirdContainer(containerView: UIView){
        self.creditsLabel = UILabel()
        self.creditsLabel.text = "000000"
        self.creditsLabel.textColor = UIColor.redColor()
        self.creditsLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.creditsLabel.sizeToFit()
        self.creditsLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird)
        self.creditsLabel.textAlignment = NSTextAlignment.Center //text alignment instance
        self.creditsLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.creditsLabel)
        
        self.betLabel = UILabel()
        self.betLabel.text = "0000"
        self.betLabel.textColor = UIColor.redColor()
        self.betLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.betLabel.sizeToFit()
        self.betLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird)
        self.betLabel.textAlignment = NSTextAlignment.Center
        self.betLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.betLabel)
        
        self.winnerPaidLabel = UILabel()//moving next to betLabel
        self.winnerPaidLabel.text = "0000"
        self.winnerPaidLabel.textColor = UIColor.redColor()
        self.winnerPaidLabel.font = UIFont(name: "Menlo-Bold", size: 16)
        self.winnerPaidLabel.sizeToFit()
        self.winnerPaidLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird)// centers the UILabel object itself, not the text inside of it
        self.winnerPaidLabel.textAlignment = NSTextAlignment.Center //centers the text inside the label, not the UILabel object
        self.winnerPaidLabel.backgroundColor = UIColor.darkGrayColor()
        containerView.addSubview(self.winnerPaidLabel)
        
        self.creditsTitleLabel = UILabel()
        self.creditsTitleLabel.text = "Credits"
        self.creditsTitleLabel.textColor = UIColor.redColor()
        self.creditsTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        self.creditsTitleLabel.sizeToFit()
        self.creditsTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.creditsTitleLabel)
        
        self.betTitleLabel = UILabel()
        self.betTitleLabel.text = "Bet"
        self.betTitleLabel.textColor = UIColor.redColor()
        self.betTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        self.betTitleLabel.sizeToFit()
        self.betTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 3, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.betTitleLabel)
        
        self.winnerPaidTitleLabel = UILabel()
        self.winnerPaidTitleLabel.text = "Winner Paid"
        self.winnerPaidTitleLabel.textColor = UIColor.redColor()
        self.winnerPaidTitleLabel.font = UIFont(name: "AmericanTypeWriter", size: 14)
        self.winnerPaidTitleLabel.sizeToFit()
        self.winnerPaidTitleLabel.center = CGPoint(x: containerView.frame.width * kSixth * 5, y: containerView.frame.height * kThird * 2)
        containerView.addSubview(self.winnerPaidTitleLabel)

    }

}