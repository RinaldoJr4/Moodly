//
//  LembretesView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  LembretesView: View {
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text("Lembretes")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.7)
                        .padding(.leading, 5)
                    Spacer()
                }
                .padding(.vertical,geo.size.height/8)
                
                Rectangle().foregroundColor(.gray)
            }
        }
    }
}

