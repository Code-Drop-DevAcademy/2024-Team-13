//
//  EmotionType.swift
//  Codedrop
//
//  Created by 이예형 on 6/15/24.
//

import Foundation

struct EmotionType{
    
    var anger: String // 분노
    var lethargic: String // 무기력함
    var anxiety: String // 불안감
    var guilty: String // 죄책감
    var sadness: String // 슬픔
    
    init(anger: String, lethargic: String, anxiety: String, guilty: String, sadness: String) {
        self.anger = "anger"
        self.lethargic = "lethargic"
        self.anxiety = "anxiety"
        self.guilty = "guilty"
        self.sadness = "sadness"
    }
}
