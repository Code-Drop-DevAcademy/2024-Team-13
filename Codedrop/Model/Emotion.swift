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
    var emotionLevel: Int
    var situation: String
    var treatment: String
    
    init(id: UUID = UUID(), date: Date, emotionType: String, emotionLevel: Int, situation: String, treatment: String) {
        self.id = id
        self.date = date
        self.emotionType = emotionType
        self.emotionLevel = emotionLevel
        self.situation = situation
        self.treatment = treatment
    }
}
