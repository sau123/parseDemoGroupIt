//
//  GameScoreMapper.swift
//  ParseDemo
//
//  Created by Ankit Jasuja on 8/13/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class GameScoreMapper: NSObject {
    func toGameScore(pfObject : PFObject?) -> GameScore? {
        var gameScoreDictionary : Dictionary<String, AnyObject> = [:]
        if let pfObject = pfObject {
            gameScoreDictionary["score"] = pfObject.objectForKey("score") as! Int
            gameScoreDictionary["playerName"] = pfObject.objectForKey("playerName") as! String
            gameScoreDictionary["cheatMode"] = pfObject.objectForKey("cheatMode") as! Bool
        }
        return GameScore(gameScoreDictionary: gameScoreDictionary)
    }
    
    func toGameScores(pfObjects : [PFObject]?) -> [GameScore] {
        var gameScores : [GameScore] = []
        if let pfObjects = pfObjects {
            for pfObject in pfObjects {
                gameScores.append(toGameScore(pfObject)!)
            }
        }
        return gameScores
    }
    
    func toPFObject(gameScore : GameScore) -> PFObject {
        let gameScorePFObject = PFObject(className: Constants.GAME_SCORE_CLASSNAME)
        
        gameScorePFObject["score"] = gameScore.score
        gameScorePFObject["playerName"] = gameScore.playerName
        gameScorePFObject["cheatMode"] = gameScore.cheatMode

        return gameScorePFObject
    }
}
