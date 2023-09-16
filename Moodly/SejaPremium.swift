//
//  SejaPremium.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 01/06/23.
//

import SwiftUI

struct SejaPremium: View {
    @Environment(\.dismiss) var presentation
    
    var body: some View {
        ZStack {
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentation.callAsFunction()
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                            .foregroundColor(.gray)
                    }.buttonStyle(.borderless)
                }.padding()
                Spacer()
            }
            .background(.white)
            .frame(width: 400,height: 300)
            
            HStack {
                Spacer()
                VStack {
                    Spacer()
                    Text("Disponível em Breve!")
                        .foregroundColor(Color("quasepreto100"))
                        .font(.custom("SFPro", size: 24))
                        .multilineTextAlignment(.leading)
                    Spacer()
                    Image("happy")
                    Spacer()
                    Button(action: {
                        presentation.callAsFunction()
                    }){
                        Text("Voltar")
                            .font(.title)
                            .foregroundColor(Color("papel100"))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10)
                            .padding(.vertical)
                        
                    }
                    .buttonStyle(.borderless)
                    .frame(width: 228, height: 40)
                    .background(Color("madeira100"))
                    .cornerRadius(4)
                    Spacer()
                    
                }
                Spacer()
            }
            
        }
    }
}

struct SejaPremium_Previews: PreviewProvider {
    static var previews: some View {
        SejaPremium()
    }
}
