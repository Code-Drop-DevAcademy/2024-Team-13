import SwiftUI

struct EmotionCheckView: View {
    @State var inputText: String = ""
    @State var inputText2: String = ""
    
    
    var body: some View {
        ZStack{
            Color("ListBackgroundColor")
                .edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Circle()
                    .stroke(Color.green, lineWidth: 6)
                    .shadow(color:.white, radius: 10)
                    .frame(width: 200, height: 200)
                    .overlay(
                        VStack{
                            Image(systemName: "camera")
                                .resizable()
                                .frame(width: 25, height: 20)
                            Text("30도")
                                .fontWeight(.black)
                                .font(.largeTitle)
                        }
                    )
                    .padding()
                
                
                List {
                    HStack{
                        Text("오늘의 감정")
                        Spacer()
                        Text("죄책감")
                    }
                    
                    Section {
                        Text(inputText)
                            .padding().frame(height: 100)
                    } header: {
                        Text("감정의 이유")
                    }
                    
                    Section {
                        Text(inputText2)
                            .padding().frame(height: 100)
                    } header: {
                        Text("나의 대처")
                    }
                    
                }
            }
        }
    }
}
