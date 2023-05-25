//
//  BoardView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct BoardView: View {
    var body: some View {
        GeometryReader { geo in
            HStack {
                VStack {
                    HStack {
                        Text("Bom dia, vamos planejar suas atividades?")
                            .font(.largeTitle)
                            .bold()
                            .foregroundColor(.black)
                            .minimumScaleFactor(0.8)
                        //                            .padding(.leading, geo.size.width/30)
                            .padding(.vertical,geo.size.height/25)
                        Spacer()
                    }
                    Rectangle().foregroundColor(.gray)
                    
                }.padding()
                VStack {
                    HStack{
                        Spacer()
                        Rectangle().foregroundColor(.black)
                            .frame(width: 2)
                            .layoutPriority(101)
                        VStack{
                            Text("24")
                                .font(.system(size: 80))
                                .bold()
                                .foregroundColor(.black)
                                .minimumScaleFactor(0.8)
                            Text("Mai")
                                .font(.largeTitle)
                                .foregroundColor(.black)
                                .minimumScaleFactor(0.8)
                        }.padding(.trailing, geo.size.width/30)
                    }
                    Spacer().layoutPriority(100)
                    ZStack{
                        VStack{
                            HStack{
                                // Postit Azul
                                Rectangle().foregroundColor(.blue)
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                                    .padding(.leading,geo.size.width/10)
                                Spacer()
                            }.padding(.top,geo.size.width/25)
                            HStack{
                                Spacer()
                                Rectangle().foregroundColor(.clear)
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                            }
                        }
                        VStack{
                            HStack{
                                Spacer()
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                            }
                            HStack{
                                // Postit Vermelho
                                Spacer()
                                Rectangle().foregroundColor(.red)
                                    .frame(width: geo.size.width/5, height: geo.size.width/5)
                            }.padding(.bottom,geo.size.width/25)
                        }
                    }.layoutPriority(90)
                }.padding()
            }
        }.clipped()
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
