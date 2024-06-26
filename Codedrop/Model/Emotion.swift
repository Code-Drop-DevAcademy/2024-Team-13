//
//  Emotion.swift
//  Codedrop
//
//  Created by 이예형 on 6/15/24.
//

import Foundation
import SwiftData

@Model
class Emotion{
    
    @Attribute(.unique) var id = UUID()
    var date: Date
    var emotionType: String
    var emotionLevel: Double
    var situation: String // 감정의 상황이나 이유
    var treatment: String // 나의 대처
    
    init(id: UUID = UUID(), date: Date, emotionType: String, emotionLevel: Double, situation: String, treatment: String) {
        self.id = id
        self.date = date
        self.emotionType = emotionType
        self.emotionLevel = emotionLevel
        self.situation = situation
        self.treatment = treatment
    }
}
