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
    override func didMoveToView(view: SKView!)
    {
        super.didMoveToView(view)
        
        //set up the scene
        self.scaleMode = SKSceneScaleMode.AspectFit
    }
    
    var userManagerInstance:userManager = userManager.sharedUserManager()

    
    override func update(currentTime: NSTimeInterval)
    {

        if !userManagerInstance.contentIsSet {
            // set up the new view
            
            var content =
                userManagerInstance.sayArray[userManagerInstance.currentCount]
                    as NSMutableDictionary
            
            
            var bgSprite = SKSpriteNode(
                imageNamed: content.valueForKey("bg") as String
            )
            bgSprite.anchorPoint = CGPointMake(0.5, 0.5)
            bgSprite.position = CGPointMake(
                CGRectGetMidX(self.view.frame),
                CGRectGetMidY(self.view.frame))
            self.addChild(bgSprite)
            
            userManagerInstance.contentIsSet = true
        }
    }
}