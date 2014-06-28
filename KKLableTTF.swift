//
//  KKLableTTF.swift
//  Palette
//
//  Created by Klaus on 6/26/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation
import SpriteKit

class KKLabelTTF: SKSpriteNode
{
    var fontColor: SKColor
    var fontName: String
    var fontSize: CGFloat
    var text: String
    var paragraphWidth: CGFloat
    
     init()
    {
        fontColor = SKColor.blackColor()
        fontName = ""
        fontSize = CGFloat(24)
        text = ""
        paragraphWidth = 400
        
        super.init(texture: nil, color: SKColor.blackColor(), size: CGSizeZero)
        
//        self.reTexture()
    }
    
    var setText: String {
    get {
       return ""
    }
    set {
        text = newValue
        reTexture()
    }
    }
    
    func reTexture()
    {
        var newTextImage = self.imageFromText(text)
        var newTexture = SKTexture(image: newTextImage)
        
        self.texture = newTexture
        
    }
    
    func imageFromText(text: String) -> UIImage?
    {
        var paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = NSLineBreakMode.ByWordWrapping
//        paragraphStyle.alignment = 
        paragraphStyle.lineSpacing = 1
        
        var font: UIFont? = UIFont(name: fontName, size: fontSize)
        if !font {
           font = UIFont(name: "Helvetica", size: fontSize)
        }
        
        var textAttributes = NSMutableDictionary()
        
        textAttributes.setObject(font, forKey: NSFontAttributeName)
        textAttributes.setObject(paragraphStyle, forKey: NSParagraphStyleAttributeName)
        textAttributes.setObject(fontColor, forKey: NSForegroundColorAttributeName)
        
        if paragraphWidth == 0 {
            paragraphWidth = self.scene.size.width
        }
        
        let options: NSStringDrawingOptions = NSStringDrawingOptions.UsesLineFragmentOrigin
        var textRect: CGRect
            textRect = (text as NSString).boundingRectWithSize(
                CGSizeMake(paragraphWidth, self.scene.size.height),
                options: options ,
                attributes: textAttributes,
                context: nil
                )
        if textRect.size.width == 0 || textRect.size.height == 0 {
            return nil
        }
        
        var selfNode = self as SKSpriteNode
        selfNode.size = textRect.size
        
        var image: UIImage = UIImage()
//        #if TARGET_OS_IPHONE
            UIGraphicsBeginImageContextWithOptions(textRect.size, false, 0.0)
            
            (text as NSString).drawInRect(textRect, withAttributes: textAttributes)
            image = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
//        #endif
        return image
    }
}