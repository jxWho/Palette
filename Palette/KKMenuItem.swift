//
//  MenuItem.swift
//  Palette
//
//  Created by Klaus on 6/19/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

class KKMenuItem: SKNode
{
    var _isEnable = false
    var _isSelected = false
    var _itemMethod: Optional< ()->() > = nil
    var anchorPoint: CGPoint
    
    init( WithItemMethod method: Optional< ()->() > )
    {
        anchorPoint = CGPointMake(0.5, 0.5)
        
        super.init()
        
        if method {
            _itemMethod = method
        }
        
        self._isEnable = true
        self._isSelected = false
    }
    
    func activate()
    {
        if _isEnable && _itemMethod {
            _itemMethod!()
        }
    }
    
    // change the value of _isSelected
    func selected()
    {
        _isSelected = true
    }
    
    func unselected()
    {
        _isSelected = false
    }
    
    func enable()
    {
        _isEnable = true
    }
    
    func disable()
    {
        _isEnable = false
    }
    
}


class KKMenuLabelItem: KKMenuItem
{
    var _label: SKLabelNode? = nil
    let _orginalScale: Float = 1.0
    
    //Conivent setters and getters for KKMenuItem
    var fontSize : CGFloat {
    get {
        return _label!.fontSize
    }
    
    set {
        _label!.fontSize = newValue
    }
    }
    
    var fontName: String {
    get {
        return _label!.fontName
    }
    
    set {
        _label!.fontName = newValue
    }
    }
    
    var fontColor : SKColor {
    get {
        return _label!.fontColor
    }
    set {
        _label!.fontColor = newValue
    }
    }
    //End of setters&getters 
    
    //
    init( WithLableText labelText: String, ItemMethod: Optional< ()->() > )
    {
        super.init(WithItemMethod: ItemMethod)
        
        _label = SKLabelNode(text: labelText)
        _label!.fontColor = SKColor.blackColor()
        _label!.fontName = "Baskerville"
        _label!.fontSize = 45
        self.addChild(_label)
    }
    
    //highlight the label when selected
    override func selected()
    {
        if _isEnable {
            super.selected()
            
            //highlight the label
            var zoomAction = SKAction.scaleTo(
                _orginalScale * 1.2,
                duration: 0.1
            )
            
            self.runAction(zoomAction)
        }
    }
    
    override func unselected()
    {
        if _isEnable {
            super.unselected()
            
            //zoom back the label
            var zoomAction = SKAction.scaleTo(_orginalScale, duration: 0.1)
            
            self.runAction(zoomAction)
        }
    }
    
    
}