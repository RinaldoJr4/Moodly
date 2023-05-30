//
//  StatusView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct StatusView: View {
    
    @State var shouldShow = false
    
    @AppStorage("status") var currentStatus = "Triste"
    
    var dictionaryStatus = ["Triste":"😭", "Feliz":"🤩"]
    var status : String
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Status")
                        .padding(.leading,geo.size.width/15)
                        .font(.largeTitle)
                        .bold()
                        .lineLimit(1)
                        .foregroundColor(.black)
                        .padding(.top,geo.size.height/8)
                        .padding(.bottom,-geo.size.height/15)
                        .minimumScaleFactor(0.6)
                    Spacer()
                }
                HStack {
                    HStack {
                        Text(currentStatus)
                            .font(.title)
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.8)
                        Spacer()
                    }.padding(.leading,geo.size.width/32)
                        .frame(width: geo.size.width/2.2)
                    Text(dictionaryStatus[currentStatus]!)
                        .font(.system(size: geo.size.width/2.8))
                        .shadow(radius: geo.size.width/45)
                        .minimumScaleFactor(0.8)
                }
            }
        }.onTapGesture {
            shouldShow.toggle()
        }.sheet(isPresented: $shouldShow, content: {OnboardingView()})
    }
}
