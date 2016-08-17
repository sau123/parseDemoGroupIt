//
//  GroupViewController.swift
//  ParseDemo
//
//  Created by Saumeel Gajera on 8/14/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class GroupViewController: UIViewController {

    let categoryDataUtil : CategoryDataUtil = CategoryDataUtil()
    let categoryManager : CategoryManager = CategoryManager()
    let _id = "Jz8AFtKQIb"

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func onCreateButon(sender: UIButton){
        print("creating..")
        let category = categoryDataUtil.createCategoryData()
        categoryManager.saveCategory(category) { (created: Bool, error: NSError?) in
            if error == nil {
                print(created)
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func onGetCategoryButton(sender: UIButton){
        print("get catogory..")
        categoryManager.getCategoryById(_id) { (category, error) in
            if error == nil {
                print(category)
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func onGetAllCategories(sender: UIButton){
        print("get all cateogories..")
        categoryManager.getAllCategories { (categories: [Category], error: NSError?) in
            if error == nil {
                print("Printing categories in view controller")
                print(categories)
            }else {
                print(error)
            }
            
        }
    }
    
    @IBAction func onDeleteCategory(sender: UIButton){
        print("on delete..")
        categoryManager.deleteCategoryById(_id) { (deleted: Bool, error: NSError?) in
            if error == nil{
                print(deleted)
            }else {
                print(error)
            }
        }
    }
    
    @IBAction func onUpdateCategoryButton(sender: UIButton){
        print("on update")
        let updatedCategory = categoryDataUtil.createCategory("yo-sau")
        categoryManager.updateCategory(_id, category: updatedCategory) { (updated: Bool, error: NSError?) in
            if error == nil{
                print(updated)
            }else {
                print(error)
            }
        }
    }
}
