//
//  GGDraggableView.swift
//  SwiftSwipeCards
//
//  Created by Eric Reber on 18.11.14.
//  Copyright (c) 2014 Eric Reber. All rights reserved.
//

import UIKit

class GGDraggableView: UIView {

    var panGestureRecognizer : UIPanGestureRecognizer!
    var originalPoint:CGPoint!
    
    override init(frame: CGRect){
        super.init(frame : frame)
        self.backgroundColor = UIColor.greenColor()
        
        
        self.panGestureRecognizer = UIPanGestureRecognizer(target: self, action: Selector("dragged:"))
        self.addGestureRecognizer(panGestureRecognizer)
        
        self.loadImageAndStyle()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    func loadImageAndStyle(){
        self.layer.cornerRadius = 8
        self.layer.shadowOffset = CGSizeMake(7.00, 7.00)
        self.layer.shadowRadius = 5
        self.layer.shadowOpacity = 0.5
    }
    
    func dragged(gestureRecognizer: UIPanGestureRecognizer) {
  
        let xDistance:CGFloat = gestureRecognizer.translationInView(self).x
        let yDistance:CGFloat = 0.00
        //If you want the card to move on the y axys too :
        //let yDistance:CGFloat = gestureRecognizer.translationInView(self).y
        
        switch(gestureRecognizer.state){
        case UIGestureRecognizerState.Began:
            self.originalPoint = self.center
            
        case UIGestureRecognizerState.Changed:
            let rotationStrength:CGFloat = min((xDistance/320),1)
            let rotationAngel:CGFloat = (2.00*CGFloat(M_PI)*CGFloat(rotationStrength) / 16.00)
            let scaleStrength:CGFloat = 1.00 - CGFloat(fabsf(Float(rotationStrength))) / 4.00
            let scale:CGFloat = max(scaleStrength, 0.93);
            
            self.center = CGPointMake(self.originalPoint.x + xDistance, self.originalPoint.y + yDistance)
            let transform:CGAffineTransform = CGAffineTransformMakeRotation(rotationAngel)
            let scaleTransform:CGAffineTransform = CGAffineTransformScale(transform, scale, scale)
            self.transform = scaleTransform
            
        case UIGestureRecognizerState.Ended:
            self.resetViewPositionAndTransformations()
        
            
        default:
            print("error default statement", terminator: "")
            
        }
    }
    
    func resetViewPositionAndTransformations(){
        UIView.animateWithDuration(0.2, animations: { () -> Void in
            self.center = self.originalPoint
            self.transform = CGAffineTransformMakeRotation(0)
        })
    }

}
