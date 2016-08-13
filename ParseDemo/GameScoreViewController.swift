//
//  GameScoreViewController.swift
//  ParseDemo
//
//  Created by Ankit Jasuja on 8/13/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class GameScoreViewController: UIViewController {

    let gameScoreDataUtil : GameScoreDataUtil = GameScoreDataUtil()
    let gameScoreManager : GameScoreManager = GameScoreManager()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func OnCreateButton(sender: AnyObject) {
        print("creating ... ")
        let gameScore = gameScoreDataUtil.createGameScoreData()
        gameScoreManager.saveGameScore(gameScore) { (created : Bool, error : NSError?) in
            if error == nil {
                print(created)
            } else {
                print(error)
            }
        }
        
    }
    
    @IBAction func onGetByIdButton(sender: AnyObject) {
        print("getting by id ... ")
        let id = "QGIGh6OS9v"
        gameScoreManager.getGameScoreById(id) { (gameScore : GameScore?, error : NSError?) in
            if error == nil {
                print(gameScore!)
            } else {
                print(error!)
            }
        }
    }
    
    @IBAction func onGetAllButton(sender: AnyObject) {
        print("getting all ... ")
        gameScoreManager.getAllGameScores { (gameScores : [GameScore], error : NSError?) in
            if error == nil {
                for gameScore in gameScores {
                    print(gameScore)
                }
            } else {
                print(error)
            }
        }
    }
    
    @IBAction func onUpdateButton(sender: AnyObject) {
        print("updating ... ")
        let id = "QGIGh6OS9v"
        let gameScore = gameScoreDataUtil.createGameScoreData("player-4")
        gameScoreManager.updateGameScore(id, gameScore: gameScore) { (updated: Bool, error : NSError?) in
            if error == nil {
                print(updated)
            } else {
                print(error)
            }
        }
    }
    
    
    @IBAction func onDeleteButton(sender: AnyObject) {
        print("deleting ... ")
        let id = "QGIGh6OS9v"
        gameScoreManager.deleteGameScoreById(id) { (deleted : Bool, error : NSError?) in
            if error == nil {
                print(deleted)
            } else {
                print(error)
            }
        }
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
