//
//  BoardView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct BoardView: View {
    
    var currentDate = Date()
    var currentDateCalendar = Calendar.current
    var dateFormater: DateFormatter {
        let formater = DateFormatter()
        formater.dateStyle = .medium
        return formater
    }
    
    var body: some View {
        GeometryReader { geo in
            ScrollView {
                HStack {
                    
                    VStack {
                        HStack {
                            Text("Bom dia, vamos planejar suas atividades?")
                                .font(.largeTitle)
                                .bold()
                                .foregroundColor(.black)
                                .minimumScaleFactor(0.8)                            .padding(.vertical,geo.size.height/25)
                            Spacer()
                        }
                        
                        TodoView()
                        
                        
                    }.padding()
                        .frame(width: geo.size.width/1.6)
                    
                    VStack {
                        HStack{
                            Spacer()
                            Rectangle().foregroundColor(.black)
                                .frame(width: 2)
                                .layoutPriority(101)
                            VStack{
                                Text("\(currentDateCalendar.component(.day, from: currentDate))")
                                    .font(.system(size: 80))
                                    .bold()
                                    .foregroundColor(.black)
                                    .minimumScaleFactor(0.8)
                                Text(String(dateFormater.string(from: currentDate)).dropLast(5).dropFirst(3))
                                    .font(.largeTitle)
                                    .foregroundColor(.black)
                                    .minimumScaleFactor(0.8)
                            }.padding(.trailing, geo.size.width/30)
                        }
                        
                        Spacer().layoutPriority(200)
                        ZStack{
                            VStack{
                                HStack{
                                    // Sombra Postit Azul
                                    Rectangle().foregroundColor(Color(white: 0.7))
                                        .frame(width: geo.size.width/5, height: geo.size.width/5)
                                    Spacer()
                                }.padding(.top,geo.size.width/23)
                                    .padding(.leading,geo.size.width/38)
                                HStack{
                                    Spacer()
                                    Rectangle().foregroundColor(.clear)
                                        .frame(width: geo.size.width/5, height: geo.size.width/5)
                                }
                            }
                            VStack{
                                HStack{
                                    // Postit Azul
                                    ZStack{
                                        Rectangle().foregroundColor(.blue)
                                            .frame(width: geo.size.width/5, height: geo.size.width/5)
                                        Text("Postit azul")
                                    }
                                    Spacer()
                                }.padding(.top,geo.size.width/25)
                                    .padding(.leading,geo.size.width/40)
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
                                    // Sombra Postit Vermelho
                                    Spacer()
                                    Rectangle().foregroundColor(Color(white: 0.7))
                                        .frame(width: geo.size.width/5, height: geo.size.width/5)
                                }.padding(.bottom,geo.size.width/30)
                            }
                            VStack{
                                HStack{
                                    Spacer()
                                        .frame(width: geo.size.width/5, height: geo.size.width/5)
                                }
                                HStack{
                                    // Postit Vermelho
                                    Spacer()
                                    ZStack {
                                        Rectangle().foregroundColor(.red)
                                            .frame(width: geo.size.width/5, height: geo.size.width/5)
                                        Text("Reflex vermelho")
                                    }
                                }.padding(.bottom,geo.size.width/25)
                                    .padding(.trailing,geo.size.width/300)
                            }
                        }.layoutPriority(90)
                    }.padding()
                }
            }.clipped()
        }.scrollIndicators(.hidden)
    }
}

struct BoardView_Previews: PreviewProvider {
    static var previews: some View {
        BoardView()
    }
}
