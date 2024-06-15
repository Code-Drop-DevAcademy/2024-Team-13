//
//  TodayView.swift
//  Codedrop
//
//  Created by 이예형 on 6/15/24.
//

import SwiftUI
import SwiftData
import Charts


struct EmotionOfDay: Identifiable {
    let id = UUID()
    let title: String
    var revenue: Double
    let color: Color
}

struct TodayView: View {

    @Environment(\.modelContext) var modelContext
    
    @Query var emotions: [Emotion]
    
    
    @State private var todayEmotion: [EmotionOfDay] = [
        .init(title: "Week", revenue: 50, color: Color.white),
        .init(title: "Day", revenue: 50, color: Color.anger)
    ]

    var body: some View {
        NavigationStack{
            ZStack {
                VStack {
                    HStack{
                        VStack(alignment: .leading,spacing: 5){
                            Text("예형님의 오늘")
                                .font(.pretendardBold26)
                            Text("육아 스트레스 온도는")
                                .font(.pretendardBold26)
                        }
                        Spacer()
                        NavigationLink(destination: EmotionListView(), label: {Image(systemName: "list.bullet.circle.fill").resizable().frame(width: 32,height: 32).foregroundStyle(Color.black)}).padding(.trailing,20)
                    }
                    .padding(.top, 58)
                    .padding(.leading,20)
                    
                    // 중앙 온도 표시
                    VStack {
                        ZStack {
                            Image("anger").resizable()
                                .frame(width: 300,height: 300)
                            
                            Chart(todayEmotion, id: \.title) { element in
                                SectorMark(
                                    angle: .value("Ratio", element.revenue),
                                    innerRadius: .ratio(0.87),
                                    angularInset: 1
                                ).foregroundStyle(element.color)
                                    .cornerRadius(5)
                            }.frame(width: 228)
                            VStack {
                                HStack (spacing: 0) {
                                    Text("50")
                                        .font(.pretendardExtraBold72)
                                    Text("°C")
                                        .font(.pretendardExtraBold62)
                                }
                            }
                        }
                        
                       
                        ZStack {
                            RoundedRectangle(cornerRadius: 18)
                                .frame(width: 310,height: 67).foregroundStyle(Color.white).shadow(color: .black.opacity(0.1), radius: 10,x: 0,y:10)
                            HStack {
                                VStack {
                                    Text("오늘의 기록").font(.pretendardMedium14)
                                        .padding(.bottom, 5)
                                    Text("3")
                                        .font(.pretendardSemiBold18)
                                }.padding(EdgeInsets(top: 12, leading: 45, bottom: 12, trailing: 45))
                                
                                Divider()
                                    .frame(height: 40)
                                
                                VStack {
                                    Text("오늘의 감정").font(.pretendardMedium14)
                                        .padding(.bottom, 5)
                                    HStack{
                                        Text("불안감")
                                        Circle()
                                            .fill(Color.anxiety)
                                            .frame(width: 24, height: 24)
                                    }
                                }.padding(EdgeInsets(top: 12, leading: 45, bottom: 12, trailing: 45))
                            }
                        }
                        
                        Spacer()
                        
                        NavigationLink(destination: EmotionRecordView(insertEmotion: insertEmotion)
                                       , label: {Text("스트레스 기록하기")
                                .font(.pretendardBold18)
                                .foregroundStyle(Color.white)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.black)
                            .cornerRadius(10)})
                        .padding(EdgeInsets(top: 20, leading: 20, bottom: 50, trailing: 20))
                        
                    }
                }
            }.background(Color.background)
        }
    }
    
    func insertEmotion(emotion: Emotion){
        modelContext.insert(emotion)
    }
}

#Preview {
    TodayView()
}
