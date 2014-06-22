//
//  userManager.swift
//  Palette
//
//  Created by Klaus on 6/21/14.
//  Copyright (c) 2014 Klaus. All rights reserved.
//

import Foundation

/*

class UserManager: NSObject
{
    class var getInstance: UserManager {
        struct instanceStruct {
            static let sInstance = UserManager()
        }
        
        return instanceStruct.sInstance
    }
   
    init()
    {
        super.init()
        

        
        var mBundle = NSBundle.mainBundle()
        var sayUrl = mBundle.pathForResource("say", ofType: "xml")
        var sayParser = NSXMLParser(
            contentsOfURL: NSURL(fileURLWithPath: sayUrl)
        )
        sayParser.delegate = self
        sayParser.shouldProcessNamespaces = false
        sayParser.shouldReportNamespacePrefixes = false
        sayParser.shouldResolveExternalEntities = false
        sayParser.parse()
        
        /*
        for i in sayArray {
            for key in i.keys {
                println(i[key])
            }
            println()
        }
        */
        println(sayArray.count)

    }
    
    //for XML parser
    var elementName: String?
    var buffString: NSMutableString?
    var xmlContent : NSMutableDictionary?
    var sayArray = Array< NSMutableDictionary>()
    var characterArray = Array< Dictionary<String, String> >()
    var currentDocument: Bool = true
    
}

extension UserManager: NSXMLParserDelegate
{
    func parser(
        parser: NSXMLParser!,
        didStartElement elementName: String!,
        namespaceURI: String!,
        qualifiedName qName: String!,
        attributes attributeDict: NSDictionary!
    )
    {
//        self.elementName = elementName
        buffString = NSMutableString()
        xmlContent = NSMutableDictionary()
    }
    
    func parser(parser: NSXMLParser!, foundCharacters string: String!)
    {
        if string != "\n" {
            buffString!.appendString(string)
        }
    }
    
    
    func parser(
        parser: NSXMLParser!,
        didEndElement elementName: String!,
        namespaceURI: String!,
        qualifiedName qName: String!
    )
    {
        
        // true for say.xml
        if currentDocument {
            if elementName == "say" {
                // This chunk of data ends
                sayArray.append(xmlContent!)
                xmlContent = NSMutableDictionary()
//                println(++cnt)
//                println(elementName)
            } else {
                xmlContent!.setObject(buffString, forKey: elementName)
                buffString = nil
            }
        }
        
    }
}

*/