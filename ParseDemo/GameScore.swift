//
//  GameScore.swift
//  ParseDemo
//
//  Created by Ankit Jasuja on 8/13/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit

class GameScore: CustomStringConvertible {
    
    var score: Int?
    var playerName : String?
    var cheatMode : Bool?
    
    init(gameScoreDictionary : Dictionary<String, AnyObject>) {
        score = gameScoreDictionary["score"] as? Int
        playerName = gameScoreDictionary["playerName"] as? String
        cheatMode = gameScoreDictionary["cheatMode"] as? Bool
    }
    
    var description: String {
        get {
            return self.playerName!
        }
    }
}
