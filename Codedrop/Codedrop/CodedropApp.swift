//
//  CodedropApp.swift
//  Codedrop
//
//  Created by 이예형 on 6/15/24.
//

import SwiftUI
import SwiftData

@main
struct CodedropApp: App {
    
    var modelContainer: ModelContainer = {
        let schema = Schema([Emotion.self])
        let modelConfiguration = ModelConfiguration(schema: schema,
                                                    isStoredInMemoryOnly: false)
        
        do {
            return try ModelContainer(for: schema,
                                      configurations: [modelConfiguration])
        } catch {
            fatalError("modelContainer가 생성되지 않았습니다: \(error)")
        }
    }()
    
    
    var body: some Scene {
        WindowGroup {
            TodayView()
                .modelContainer(modelContainer)
        }
    }
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
