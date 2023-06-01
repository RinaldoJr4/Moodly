//
//  SejaPremium.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 01/06/23.
//

import SwiftUI

struct SejaPremium: View {
    
    @State var state = 1
    
    @Environment(\.dismiss) var presentation
    
    var body: some View {
        ZStack {
            if state == 1 {
                Image("sejaPremium").resizable()
                VStack {
                    Spacer()
                    Button {
                        state = 2
                    } label: {
                        ZStack {
                            Rectangle().foregroundColor(.brown).frame(width: 200,height: 50)
                                .cornerRadius(15)
                            Text("Vire premium")
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                    .buttonStyle(.borderless)
                    .padding(.bottom, 50)

                }
            }
            else {
                Image("sejaPremium2").resizable()
            }
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentation.callAsFunction()
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                            .foregroundColor(.black)
                    }.buttonStyle(.borderless)
                }.padding()
                Spacer()
            }
            
        }.frame(width: 700,height: 700)
    }
}

struct SejaPremium_Previews: PreviewProvider {
    static var previews: some View {
        SejaPremium()
    }
}
