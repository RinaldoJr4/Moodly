//
//  StatusView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct StatusView: View {
    var status: String
    var body: some View {
        GeometryReader { geo in
            HStack {
                VStack{
                    Text("Status")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding(.vertical,geo.size.height/8)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    Text(status)
                        .font(.title)
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.1)
                        .lineLimit(1)
                    Spacer()
                } .frame(width: geo.size.width/2.7)
                Circle()
                    .foregroundColor(.yellow)
                    .padding()
            }
        }
    }
}
