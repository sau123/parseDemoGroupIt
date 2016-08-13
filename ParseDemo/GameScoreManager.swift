//
//  GameScoreManager.swift
//  ParseDemo
//
//  Created by Ankit Jasuja on 8/13/16.
//  Copyright © 2016 iOS Group 5. All rights reserved.
//

import UIKit
import Parse

class GameScoreManager: NSObject {

    let gameScoreDao = ParseGameScoreDAO(className: Constants.GAME_SCORE_CLASSNAME)
    let gameScoreMapper = GameScoreMapper()
    
    func saveGameScore(gameScore : GameScore, completion : (Bool, NSError?) -> ()) -> Void {
        let pfObject = gameScoreMapper.toPFObject(gameScore)
        gameScoreDao.saveGameScore(pfObject) { (created : Bool, error : NSError?) in
            completion(created, error)
        }
    }
    
    func updateGameScore(id : String, gameScore : GameScore, completion : (Bool, NSError?) -> Void) {
        let pfObjectNew = gameScoreMapper.toPFObject(gameScore)
        gameScoreDao.updateGameScoreById(id, pfObjectNew: pfObjectNew) { (updated : Bool, error : NSError?) in
            completion(updated, error)
        }
    }
    
    func getAllGameScores(completion : ([GameScore], NSError?) -> Void) {
        gameScoreDao.getAllGameScores { (pfObjects : [PFObject]?, error : NSError?) in
            completion(self.gameScoreMapper.toGameScores(pfObjects), error)
        }
    }
    
    func getGameScoreById(id : String, completion : (gameScore : GameScore?, error : NSError?) -> Void) {
        gameScoreDao.getGameScoreById(id) { (pfObject: PFObject?, error : NSError?) in
            completion(gameScore: self.gameScoreMapper.toGameScore(pfObject), error: error)
        }
    }
    
    func deleteGameScoreById(id : String, completion : (Bool, NSError?) -> Void)  {
        gameScoreDao.deleteGameScorebyId(id) { (deleted : Bool, error : NSError?) in
            completion(deleted, error)
        }
    }
}
