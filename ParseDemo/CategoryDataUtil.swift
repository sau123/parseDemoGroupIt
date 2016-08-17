//
//  CategoryDataUtil.swift
//  ParseDemo
//
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class CategoryDataUtil: NSObject {

    func createCategoryData() -> Category {
        var categoryDictionary : Dictionary<String, AnyObject> = [:]
        categoryDictionary["name"] = "Saumeel"
        categoryDictionary["ownerID"] = "player-5"
        return Category(categoryDictionary: categoryDictionary)
    }
    
    func createCategory(playerName : String) -> Category {
        var categoryDictionary: Dictionary<String, AnyObject> = [:]
        categoryDictionary["name"] = playerName
        categoryDictionary["ownerID"] = "id-updated"
        return Category(categoryDictionary: categoryDictionary)
    }

}
