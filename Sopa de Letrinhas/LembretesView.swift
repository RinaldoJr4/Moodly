//
//  LembretesView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  LembretesView: View {
    
    @State var shouldShow = false
    
    var body: some View {
        GeometryReader { geo in
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
            }.onTapGesture {
                shouldShow.toggle()
            }.sheet(isPresented: $shouldShow, content: {LembretePopUpView()})
        }
    }
}

