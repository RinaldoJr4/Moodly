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
    
    @EnvironmentObject var currentStatus: MoodManager
    
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

                if selectedButton2 == ("happy") {
                    Text("Que massa! Que tal tentar realizar atividades que você está querendo muito concluir? Lembre de ter cuidado para não se sobrecarregar. Bora simbora!")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                else if selectedButton2 == ("sad") {
                    Text("Tá tudo certo, nem sempre estaremos bem! Talvez você não seja tão produtivo hoje, mantenha isso em mente e busque não se cobrar tanto. Vai dar bom!")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                else if selectedButton2 == ("angry") {
                    Text("Sei que não é o melhor momento. Se tiver que fazer algo, que tal priorizar apenas o que é necessário e, se surgir a oportunidade, tirar um tempo para conversar com alguém.")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                else if selectedButton2 == ("anxious") {
                    Text("Tá tudo certo, nem sempre estaremos bem! Talvez você não seja tão produtivo hoje, mantenha isso em mente e busque não se cobrar tanto. Vai dar bom!")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                else if selectedButton2 == ("neutral") {
                    Text("Massa! Bora começar o dia com o pé direito organizando as tarefas.")
                        .padding(.bottom, 78)
                        .padding(.top, 64)
                        .padding(.leading, 110)
                        .padding(.trailing, 95)
                        .foregroundColor(Color("quasepreto100"))
                }
                
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

