//
//  GGView.swift
//  SwiftSwipeCards
//
//  Created by Eric Reber on 18.11.14.
//  Copyright (c) 2014 Eric Reber. All rights reserved.
//

import UIKit

class GGView: UIView {

    var draggableView:GGDraggableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        print("InitGGView")
        self.backgroundColor = UIColor.whiteColor()
        self.loadDraggableCustomView()
    }
    
    func loadDraggableCustomView(){
        self.draggableView = GGDraggableView()
        self.draggableView.backgroundColor = UIColor.blueColor()
        self.draggableView.frame = CGRectMake(60, 60, 200, 260)
        self.addSubview(self.draggableView)
        
    }
    
    func layoutSubViews()
    {
        super.layoutSubviews()
        self.draggableView.frame = CGRectMake(60, 60, 200, 260)
    }
    
    
}
