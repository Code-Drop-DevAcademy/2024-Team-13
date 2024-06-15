//
//  EmotionRecordView.swift
//  CodeDrop
//
//  Created by 원주연 on 6/15/24.
//

import SwiftUI
import SwiftData

struct EmotionRecordView: View {
    @Environment(\.modelContext) var modelContext
    @Query var emotions: [Emotion]
    
    @Environment(\.dismiss) private var dismiss
//    private let emotion: Emotion
    let emotionType = EmotionType(anger: "분노", lethargic: "무기력함", anxiety: "불안함", guilty: "죄책감", sadness: "슬픔")
    @State private var selectedDate = Date()
    @State private var selectedEmotion: String = ""
    @State private var value = 0.0
    @State var inputText = ""
    @State var inputText2 = ""

    let insertEmotion: (Emotion) -> Void
    
//    @ObservedObject var emotionType = EmotionType()
    
    var body: some View {
        NavigationStack{
            List{
                Section { // 날짜 설정
                    DatePicker("날짜", selection: $selectedDate, displayedComponents: .date)
                    DatePicker("시간", selection: $selectedDate, displayedComponents: .hourAndMinute)
                } header: {
                    Text("날짜 설정")
                }
                
                Section { // 오늘의 감정
                    Picker("오늘의 감정 선택하기", selection: $selectedEmotion){
                        Text(emotionType.anger).tag(emotionType.anger)
                        Text(emotionType.anxiety).tag(emotionType.anxiety)
                        Text(emotionType.guilty).tag(emotionType.guilty)
                        Text(emotionType.lethargic).tag(emotionType.lethargic)
                        Text(emotionType.sadness).tag(emotionType.sadness)
                    }
                } header: {
                    Text("날짜 설정")
                }
                
                Section {
                    VStack{
                        HStack{
                            Text("0")
                            Slider(value: $value, in: 0...100)
                            Text("100")
                        }.padding().frame(height: 40)
                        Text("지금 나의 감정 온도는 \(Int(value))도 예요.")
                    }
                } header: {
                    Text("감정 레벨")
                }
                
                Section {
                    TextField("감정이 든 상황과 이유를 작성해주세요.", text: $inputText)
                        .padding().frame(height: 100)
                } header: {
                    Text("감정의 이유")
                }
                
                Section {
                    TextField("그에 대한 나의 대처를 작성해주세요.", text: $inputText2)
                        .padding().frame(height: 100)
                } header: {
                    Text("나의 대처")
                }
            }
        }.toolbar { // <- 저장 버튼
            Button {
                let newEmotion = Emotion(date: selectedDate, emotionType: selectedEmotion, emotionLevel: value, situation: inputText, treatment: inputText2)
                insertEmotion(newEmotion)
                
                dismiss()
            } label: {
                Text("저장")
            }
        }
    }
}
//
//#Preview {
//    EmotionRecordView()
//}
