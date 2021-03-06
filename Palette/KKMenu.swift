//
//  Menu.swift
//  Palette
//
//  Created by Klaus on 6/19/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SPriteKit
import UIKit

class KKMenu: SKNode
{
    var menuItem: Array<KKMenuItem> = []
    var _selectedItem: KKMenuItem? = nil
    var anchorPoint: CGPoint
    init(items: Array<KKMenuItem> )
    {

        anchorPoint = CGPointMake(0.5, 0.5)
        super.init()
        menuItem.unshare()
        
        var mainRect = UIScreen.mainScreen().applicationFrame
        self.position = CGPointMake(
            CGRectGetMidX(mainRect),
            CGRectGetMidY(mainRect)
        )

        self.userInteractionEnabled = true
        //Create menuItems and add them to the scene
        var z:CGFloat = 0.0
        for item: KKMenuItem in items {
            
            var items = self.children as Array<KKMenuItem>
            
            item.zPosition = z
            z++
            self.addChild(item)
        }
    }
    
    func alignItemVerticallyWithPadding(padding: CGFloat)
    {
        //There's no padding for the first item
        var height = -padding
        var items = self.children as Array<KKMenuItem>
        // sum up all heights of items with padding
        for item in items {
            height += item.frame.size.height + padding
        }
        
        //the anchor point of the menu is (0.5, 0.5), which is the origin
        //above the anchor point, the height is half total heghit
        var y: CGFloat = height / 2.0
        
        //for the position of the item
        for item in items {
            //by defaul, anchor point is (0.5, 0.5)
            //then only deducted half height
            item.position = CGPointMake(0, y - item.frame.size.height / 2.0 )
            y -= item.frame.size.height + padding
        }
    }
    
}


extension KKMenu
{
    
    func itemForTouch(touch: UITouch) -> KKMenuItem?
    {
        var items = self.children as Array<KKMenuItem>
        var location = touch.locationInNode(self)
        println("total children:", self.children.count)
        for item in items{
            println(location)
            if item.containsPoint(location) {
                println("in")
                return item
            }
        }
        return nil
    }
    
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!)
    {
        println("total children:", self.children.count)
        var touchesArray = touches.allObjects
        println(touchesArray.count)
        _selectedItem = itemForTouch(touchesArray[0] as UITouch)
        
        if _selectedItem {
            _selectedItem!.selected()
        }
    }
    
    override func touchesEnded(touches: NSSet!, withEvent event: UIEvent!)
    {
        
        
        //assert( _selectedItem, "No item is selected" )
        
        if _selectedItem {
            _selectedItem!.unselected()
            _selectedItem!.activate()
        }
        
        
        println("touches ended")
    }
    
    override func touchesMoved(touches: NSSet!, withEvent event: UIEvent!)
    {
        var touch = touches.allObjects[0] as UITouch
        var currentItem = itemForTouch(touch)
        
        if currentItem && currentItem != _selectedItem {
            _selectedItem!.unselected()
            _selectedItem = currentItem
            _selectedItem!.selected()
        }
    }
}
