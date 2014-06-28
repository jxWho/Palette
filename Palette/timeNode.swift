//
//  timeNode.swift
//  Palette
//
//  Created by Klaus on 6/26/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

class TimeNode: SKNode
{
    init(WithTime time: String)
    {
        super.init()
        
        println("Call" )
        //
        
        var mainRect = UIScreen.mainScreen().applicationFrame
        self.position = CGPointMake(
            CGRectGetMidX(mainRect),
            CGRectGetMidY(mainRect)
        )
        var tempBG = SKSpriteNode(imageNamed: "64")
        tempBG.anchorPoint = CGPointMake(0.5, 0.5)
        
        self.addChild(tempBG)
            
        var timeLable = SKLabelNode(text: time)
        timeLable.fontColor = SKColor.blackColor()
        
        self.addChild(timeLable)
        
  
        NSTimer.scheduledTimerWithTimeInterval(2,
            target: self,
            selector: Selector("removeTime:"),
            userInfo: nil,
            repeats: false
        )
    }
    
    func removeTime(theTimer: NSTimer)
    {
       self.removeFromParent()
    }
}
