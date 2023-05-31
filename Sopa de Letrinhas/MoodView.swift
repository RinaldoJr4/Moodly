//
//  MoodView.swift
//  Sopa de Letrinhas
//
//  Created by livia on 30/05/23.
//
import SwiftUI

struct MoodView: View {
    @State private var selectedButton: String?
    @State private var selectedButton2: String?
    
    @EnvironmentObject var currentStatus: MoodMangr
    
    @Environment(\.dismiss) var presentation
    
    @AppStorage("mood") var mood: String = ""
    
    let moods = ["happy", "sad", "angry", "anxious", "neutral"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 701, height: 588)
                .foregroundColor(Color("papel20"))
            
            VStack {
                Text("STATUS")
                    .font(.title)
                    .padding(.top, 49)
                    .fontWeight(.bold)
                    .foregroundColor(Color("madeira100"))
                
                Text("Como você está se sentindo hoje?")
                    .padding(.top, 89)
                    .padding(.bottom, 64)
                    .foregroundColor(Color("quasepreto100"))
                
                HStack {
                    ForEach(moods, id: \.self) { mood in
                        Button(action: {
                            withAnimation(.spring()) {
                                if selectedButton2 == mood {
                                    selectedButton2 = nil
                                } else {
                                    selectedButton2 = mood
                                }
                                
                            }
                            selectedButton = mood
                            self.mood = mood
                            print("Selected mood: \(selectedButton ?? "")")
                        }){Image(mood)
                                .onHover { hover in
                                    withAnimation {
                                        if hover {
                                            selectedButton = mood
                                        } else if selectedButton == mood {
                                            selectedButton = nil
                                        }
                                    }
                                    
                                }
                            
                        }
                        .buttonStyle(.borderless)
                        .scaleEffect(selectedButton2 == mood ? 1.4 : 1)
                        
                        .scaleEffect(selectedButton == mood ? 1.3 : 1)
                        
                        
                    }
                    .padding(.horizontal, 12)
                }

                if selectedButton2 == ("angry") {
                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                else
                
                Button(action: {
                    if selectedButton2 != nil {
                        presentation.callAsFunction()
                        currentStatus.currentStatus = selectedButton2!
                        StatusManager.shared.updateStatus(with: mood)
                        NotificationCenter.default.post(name: NSNotification.Name("DismissMoodView"), object: nil)
                    }
                }){
                    Text("ok")
                        .font(.title)
                        .foregroundColor(Color("papel100"))
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 100)
                        .padding(.vertical)
                        
                }
                .buttonStyle(.borderless)
                .frame(width: 228, height: 40)
                .background(Color("madeira100"))
                .cornerRadius(4)
                .padding(.bottom, 40)
                
            }
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}

