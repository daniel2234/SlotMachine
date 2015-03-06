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
        setupSecondContainer(self.secondContainer)
        
        
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
//                
//
//            slotImageView.addSubview(labelSlot)
//            
//            containerView.addSubview(slotImageView)
            
            }
            
        
        }
    
    
    }

}

