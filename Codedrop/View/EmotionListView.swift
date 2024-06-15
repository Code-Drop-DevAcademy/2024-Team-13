//
//  EmotionListView.swift
//  Codedrop
//
//  Created by 이예형 on 6/15/24.
//

import SwiftUI
import SwiftData

struct EmotionListView: View {
    @Query var emotions: [Emotion]
    
    var body: some View {
        NavigationStack{
            List {
                Section { // 데이터 Section 추가
                    ForEach(emotions, id: \.self) { item in
                        Text(formattedDate(date: item.date))
                    }
                } header: { // header 추가
                    Text("지난 내 감정들")
                }
            }
        }.navigationTitle("나의 감정기록")
    }
    func formattedDate(date: Date) -> String {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy년 MM월 dd일"  // 원하는 형식으로 포맷팅
            return formatter.string(from: date)
        }
}

#Preview {
    EmotionListView()
}
