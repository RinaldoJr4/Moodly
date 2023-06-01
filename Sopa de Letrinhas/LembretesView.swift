//
//  LembretesView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  LembretesView: View {
    
    @State var shouldShow = false
    
    var notify = NotificationManager()
    
    @AppStorage("reflex") var isReflexaoOn = true
    @AppStorage("descanso") var isDescansoOn = false
    @AppStorage("dormir") var isDormirOn = false
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("postitDobrado")
                    .resizable()
                    .shadow(radius: geo.size.height/80)
                
                VStack {
                    HStack {
                        Text("Lembretes")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.7)
                            .padding(.leading,geo.size.width/15)
                            .padding(.top,geo.size.height/8)
                        Spacer()
                    }
                    .padding(.top,geo.size.height/30)
                    
                    Image("Clock")
                        .resizable()
                        .frame(maxWidth: 70,maxHeight: 70)
                        .frame(minWidth: 30,minHeight: 30)
                        .scaledToFit()
                        .padding(.top,geo.size.height/45)
                        .padding(.bottom,geo.size.height/4)
                }
                .onAppear {
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
                }
                .onTapGesture {
                    shouldShow.toggle()
                }.sheet(isPresented: $shouldShow, content: {LembretePopUpView()})
            }
        }
    }
}

