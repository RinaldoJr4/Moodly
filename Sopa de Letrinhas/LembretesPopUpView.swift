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
                        .bold()
                        .font(.largeTitle)
                    
                }.padding(.bottom,20)
                HStack {
                    Text("Reflexão")
                        .font(.title)
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
        }
        .frame(width: 500,height: 300)
    }
}

struct LembretePopUpView_Previews: PreviewProvider {
    static var previews: some View {
        LembretePopUpView()
    }
}
