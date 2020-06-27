//
//  HighScoreItem.swift
//  BullsEye
//
//  Created by Tilek Sulaymanbekov on 6/18/20.
//  Copyright © 2020 Tilek Sulaymanbekov. All rights reserved.
//

import Foundation

class HighScoreItem {
    var name: String
    var score: Int
    var scoreString: String {
        return String(self.score)
    }
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
