//
//  Category.swift
//  ParseDemo
//
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

// there's only one category
// each catogory has only one owner

class Category: CustomStringConvertible {
    
    var name: String?
    var ownwerID: String?
    
    init(categoryDictionary: Dictionary<String, AnyObject>) {
        name = categoryDictionary["name"] as? String
        ownwerID = categoryDictionary["ownerID"] as? String
    }
    
    var description: String {
        get {
            return self.name!
        }
    }

}
