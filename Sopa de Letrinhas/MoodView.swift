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
    
//    @AppStorage("mood")

    let moods = ["happy", "sad", "angry", "anxious", "neutral"]
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: 600, height: 600)
                .foregroundColor(Color("papel20"))
            
            VStack {
                Text("Status")
                    .font(.title)
                    .padding(.top)
                    .fontWeight(.bold)
                Spacer()
                
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
                
                Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .padding(.bottom, 100)
                    .padding(.horizontal)
            }
        }
    }
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}

