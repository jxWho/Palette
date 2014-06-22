//
//  firstScene.swift
//  Palette
//
//  Created by Klaus on 6/18/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

class firstScene: SKScene
{
    var op1: SKSpriteNode? = nil
    var op2: SKSpriteNode? = nil
    var logo: SKSpriteNode? = nil
    var menu : KKMenu? = nil
    
    override func didMoveToView(view: SKView!)
    {
        super.didMoveToView(view)
        
        /* set up your scene */
        
        self.scaleMode = SKSceneScaleMode.AspectFit
        
        op1 = SKSpriteNode(imageNamed: "op1")
        op1!.position = CGPointMake(
                CGRectGetMidX(self.frame),
                CGRectGetMidY(self.frame)
        )
        self.addChild(op1)
        
        op2 = SKSpriteNode(imageNamed: "op2")
        op2!.position = CGPointMake(
                CGRectGetMidX(self.frame),
                CGRectGetMidY(self.frame)
        )       
        self.addChild(op2)
        
        logo = SKSpriteNode(imageNamed: "logo")
        logo!.position = CGPointMake(
            self.frame.size.width * (8 / 11),
            self.frame.size.height * (9 / 10)
        )
        self.addChild(logo)
        
        // menu item 1, new game
        var menuItem1 = KKMenuLabelItem(
            WithLableText: "New Game",
            ItemMethod: {
            //Go to the New Game scene
                var transition = SKTransition.fadeWithDuration(1.5)
                var NGScene = newGameScene(size: self.frame.size)
                self.view.presentScene(NGScene, transition: transition)
            }
        )
        // menu item2
        var menuItem2 = KKMenuLabelItem(
            WithLableText: "Continue",
            ItemMethod: nil
        )
        
        var menuItem3 = KKMenuLabelItem(
            WithLableText: "Album",
            ItemMethod: nil
        )
        
        menu = KKMenu(items: [menuItem1, menuItem2, menuItem3] )
        menu!.position = CGPointMake(
                self.frame.size.width * ( 8 / 10 ),
                self.frame.size.height * (7 / 13)
        )
        self.addChild(menu)
        menu!.alignItemVerticallyWithPadding(60.0)
        
        
    }
    
}