//
//  LembretePopUpView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 27/05/23.
//

import SwiftUI

struct LembretePopUpView: View {
    
    @Environment(\.dismiss) var presentation
    
    var notify = NotificationManager()
    
    @AppStorage("reflex") var isReflexaoOn = true
    @AppStorage("descanso") var isDescansoOn = false
    @AppStorage("dormir") var isDormirOn = false
    
    @State var shouldShow2 = false
    
    var body: some View {
        ZStack {
            
            Rectangle().foregroundColor(.white)
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentation.callAsFunction()
                        if isReflexaoOn {
                            notify.reflexNotificationOn()
                        }
                        else {
                            notify.reflexNotificationOff()
                        }
                        
                        if isDormirOn {
                            notify.dormirNotificationOn()
                        }
                        else {
                            notify.dormirNotificationOff()
                        }
                        
                        if isDescansoOn {
                            notify.descansoNotificationOn()
                        }
                        else {
                            notify.descansoNotificationOff()
                        }
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                    }.buttonStyle(.borderless)
                }.padding()
                Spacer()
            }
            
            VStack(spacing: 5) {
                HStack {
                    Text("Lembretes")
                        .font(.custom("PumpkinCheesecakeRegular", size: 40))
                        .foregroundColor(.black)
                    
                }.padding(.bottom,20)
                Text("Ative os lembretes que você quer receber durante o dia!")
                    .font(.title2)
                    .padding(.bottom,20)
                
                HStack {
                    Text("Reflexão")
                        .font(.title)
                        .foregroundColor(.black)
                    
                    Spacer()
                    Text("(18:00)")
                        .font(.title)
                        .foregroundColor(.gray)
                    Toggle(isOn: $isReflexaoOn, label: {})
                        .toggleStyle(.switch)
                        .preferredColorScheme(.light)
                }.padding()
                .border(.black,width: 2)
                HStack {
                    Text("Descanso")
                        .font(.title)
                        .foregroundColor(.black)

                    Spacer()
                    Text("(12:30)")
                        .font(.title)
                        .foregroundColor(.gray)
                    Toggle(isOn: $isDescansoOn, label: {})
                        .toggleStyle(.switch)
                        .preferredColorScheme(.light)
                }.padding()
                    .border(.black,width: 2)
                HStack {
                    Text("Dormir")
                        .font(.title)
                        .foregroundColor(.black)

                    Spacer()
                    Text("(21:30)")
                        .font(.title)
                        .foregroundColor(.gray)
                    Toggle(isOn: $isDormirOn, label: {})
                        .toggleStyle(.switch)
                        .preferredColorScheme(.light)
                }.padding()
                    .border(.black,width: 2)
            }.padding(30)
                .onTapGesture {
                    shouldShow2.toggle()
                }
        }
        .sheet(isPresented: $shouldShow2, content: {SejaPremium()})
        .frame(width: 500,height: 400)
    }
}

struct LembretePopUpView_Previews: PreviewProvider {
    static var previews: some View {
        LembretePopUpView()
    }
}
