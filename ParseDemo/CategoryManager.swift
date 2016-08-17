//
//  CategoryManager.swift
//  ParseDemo
 //
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class CategoryManager: NSObject {
//    let categoryScoreDao = ParseCategoryDAO(className: Constants.CATOEGORY_CLASSNAME)
    let categoryScoreDao = ParseGameScoreDAO(className: Constants.CATOEGORY_CLASSNAME)
    
    let categoryMapper = CategoryMapper()
    
    func saveCategory(category: Category, completion: (Bool, NSError?) -> ()) {
        let pfObject = categoryMapper.toPFObject(category)
        categoryScoreDao.saveGameScore(pfObject) { (created: Bool, error: NSError?) in
            completion(created, error)
        }
    }
    
    func getAllCategories(completion : ([Category],NSError?) -> Void) {
        categoryScoreDao.getAllGameScores { (pfObjects: [PFObject]?, error: NSError?) in
            completion(self.categoryMapper.toCategories(pfObjects), error)
        }
    }
    
    func getCategoryById(id: String, completion: (category: Category?, error: NSError?) -> Void){
        categoryScoreDao.getGameScoreById(id) { (pfObject: PFObject?, error: NSError?) in
            completion(category: self.categoryMapper.toCatogory(pfObject), error: error)
        }
    }
    
    func deleteCategoryById(id: String, completion: (Bool, NSError?) -> Void){
        categoryScoreDao.deleteGameScorebyId(id) { (deleted: Bool, error: NSError?) in
            completion(deleted, error)
        }
    }
    func updateCategory(id: String, category: Category, completion: (Bool, NSError?) -> Void){
        let pfObjectNew = categoryMapper.toPFObject(category)
        categoryScoreDao.updateGameScoreById(id, pfObjectNew: pfObjectNew) { (updated: Bool, error: NSError?) in
            completion(updated, error)
        }
    }
}
