//
//  CalendarioView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  CalendarioView: View {
    @State var size = CGSize()
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Calendario")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .padding(.leading,geo.size.width/32)
                    Spacer()
                }
                .padding(.top,geo.size.height/30)
                
                Rectangle().foregroundColor(.gray)
                    .padding(.top,-10)
            }
        }
    }
}
