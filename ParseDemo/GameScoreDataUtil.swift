//
//  GameScoreDataUtil.swift
//  ParseDemo
//
//  Created by Ankit Jasuja on 8/13/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class GameScoreDataUtil: NSObject {

    func createGameScoreData() -> GameScore {
        var gameScoreDictionary : Dictionary<String, AnyObject> = [:]
        gameScoreDictionary["score"] = 1337
        gameScoreDictionary["playerName"] = "player-5"
        gameScoreDictionary["cheatMode"] = false
        return GameScore(gameScoreDictionary: gameScoreDictionary)
    }
    
    func createGameScoreData(playerName : String) -> GameScore {
        var gameScoreDictionary : Dictionary<String, AnyObject> = [:]
        gameScoreDictionary["score"] = 1337
        gameScoreDictionary["playerName"] = playerName
        gameScoreDictionary["cheatMode"] = false
        return GameScore(gameScoreDictionary: gameScoreDictionary)
    }

    
    
}
