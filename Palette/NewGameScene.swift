//
//  NewGameScene.swift
//  Palette
//
//  Created by Klaus on 6/21/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

class newGameScene: SKScene
{
    var bgSprite: SKSpriteNode?
    var subtitle: subtitleNode?
    
    override func didMoveToView(view: SKView!)
    {
        bgSprite = SKSpriteNode(imageNamed: "64")
        
        super.didMoveToView(view)
        
        //set up the scene
        self.scaleMode = SKSceneScaleMode.AspectFit
        self.backgroundColor = SKColor.whiteColor()
        
        var text = KKLabelTTF()
        text.position = CGPointMake(
            CGRectGetMidX(self.frame),
            CGRectGetMidY(self.frame)
        )
        self.addChild(text)
        
        //background
        bgSprite!.anchorPoint = CGPointMake(0.5, 0.5)
        bgSprite!.position = CGPointMake(
            CGRectGetMidX(self.view.frame),
            CGRectGetMidY(self.view.frame))
        self.addChild(bgSprite)
        
        // add the shell to show texts
        subtitle = subtitleNode()
        subtitle!.position = CGPointMake(
            CGRectGetMidX(self.frame),
            subtitle!.position.y
        )
        subtitle!.zPosition = 88
        self.addChild(subtitle)
    }
    
    var userManagerInstance:userManager = userManager.sharedUserManager()

   
    //used to record time
    var lastUpdateTimeInterval: NSTimeInterval = 0
    override func update(currentTime: NSTimeInterval)
    {

        if !userManagerInstance.contentIsSet {
            // set up the new view
            
            //get all the current information
             var content =
                userManagerInstance.sayArray[userManagerInstance.currentCount]
                    as NSMutableDictionary
            
            //if "shijian" exists, show it
            if let time = content.valueForKey("shijian") as? String {
                
                var timeNode = TimeNode(WithTime: time)
                timeNode.position = CGPointMake(
                    CGRectGetMidX(self.frame),
                    CGRectGetMidY(self.frame)
                )
                timeNode.zPosition = 100
                self.addChild(timeNode)
            }
            
            // show the background
            var bgImage = content.objectForKey("bg") as String
            println(bgImage)
            var bgTexture = SKTexture(imageNamed: bgImage)
            bgSprite!.texture = bgTexture
            
            
            userManagerInstance.contentIsSet = true
        }
        
        var timeSinceLast = currentTime - lastUpdateTimeInterval
        lastUpdateTimeInterval = currentTime
        if timeSinceLast > 1 {
            timeSinceLast = 1.0 / 60.0 //at the beginning, timeSinceLast is larger than 1 sec
            lastUpdateTimeInterval = currentTime
        }
        
        //update subtitle
        subtitle!.updateNode(WithLastTime: timeSinceLast)
        
    }
    
    
}