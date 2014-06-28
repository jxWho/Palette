//
//  shellA.swift
//  Palette
//
//  Created by Klaus on 6/26/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

let PanelBg = "panel_bg"
let UPDATE_INTERVAL: NSTimeInterval = 1

class subtitleNode: SKNode
{
    var bg: SKSpriteNode;
    var subtitle: KKLabelTTF;
    init()
    {
        //initial variables of subtitleNode
        bg = SKSpriteNode(imageNamed: PanelBg)
        bg.anchorPoint = CGPointMake(0.5, 0.5)
        
        subtitle = KKLabelTTF()

        //init father
        super.init()
        
        // set up the node
        
        self.addChild(bg)
        self.addChild(subtitle)
        
        subtitle.paragraphWidth = bg.size.width
        subtitle.anchorPoint = CGPointMake(0,0)
        subtitle.fontColor = SKColor.blackColor()
        subtitle.position = CGPointMake(
            0 - bg.size.width / 2 ,
            bg.size.height * 1 / 3
        )
        self.position = CGPointMake(0, bg.size.height / 2)
    }
    
    var lastAddingTimeInterval: NSTimeInterval = 0
    var wordCount = 0
    var wordScalar: String.UnicodeScalarView.IndexType?
    func updateNode(WithLastTime lastTime: NSTimeInterval)
    {
        var UM = userManager.sharedUserManager()
        var index = UM.currentCount
        var sayContent = UM.sayArray.objectAtIndex(index) as NSDictionary
        
        lastAddingTimeInterval += lastTime
        //update the subtitle every sec
        if lastAddingTimeInterval > UPDATE_INTERVAL {
            lastAddingTimeInterval = 0
            //update the string
            updateSubtitle()
        }
    }
    
    func updateSubtitle()
    {
        var UM = userManager.sharedUserManager()
        var index = UM.currentCount
        var sayContent = UM.sayArray.objectAtIndex(index) as NSDictionary
        var word = sayContent.objectForKey("word") as String
            
        // Scalar used to seperate the sentence word by word
        if wordScalar == nil {
            wordScalar = word.unicodeScalars.startIndex
        }
        
        // in case access the wrong position
        if wordScalar != word.unicodeScalars.endIndex {
            //get the next character
            var newCharacter = word.unicodeScalars[ wordScalar! ]
            // update the subtitle
            subtitle.setText = subtitle.text + "\(newCharacter)"
            //get the next index
            wordScalar = wordScalar!.succ()
        }       
    }
}