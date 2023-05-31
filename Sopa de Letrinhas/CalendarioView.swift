//
//  CalendarioView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  CalendarioView: View {
    
    @State var size = CGSize()
    @AppStorage("corCalendario") var corCalendario = "postitRasgadoAmarelo"
    
    let daysOfTheWeek = ["","Domingo","Segunda-feira","Terça-feira","Quarta-feira","Quinta-feira","Sexta-feira","Sábado"]
    
    let today  = Date.now
    var todayCalendar = Calendar.current
    var formatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH"
        return formatter
    }
    
    var body: some View {
        GeometryReader { geo in
            VStack {
                HStack {
                    Text(daysOfTheWeek[todayCalendar.component(.weekday, from: today)])
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.8)
                        .padding(.leading,geo.size.width/15)
                        .padding(.top,geo.size.height/10)
                    Spacer()
                }
                .padding(.top,geo.size.height/8)
                
                HStack {
                    Spacer()
                    
                    if ((Int(formatter.string(from: today)) ?? 0) <= 11) {
                        // Madrugada
                        Image("Day")
                            .resizable()
                            .frame(maxWidth: 70,maxHeight: 70)
                            .frame(minWidth: 30,minHeight: 30)
                            .scaledToFit()
                            .padding(.top,-geo.size.height/35)
                            .onAppear {
                                corCalendario = "postitRasgadoAmarelo"
                            }
                    } else if ((Int(formatter.string(from: today)) ?? 0) >= 18){
                        // Noite
                        Image("Night")
                            .resizable()
                            .frame(maxWidth: 70,maxHeight: 70)
                            .frame(minWidth: 30,minHeight: 30)
                            .scaledToFit()
                            .padding(.top,-geo.size.height/45)
                            .onAppear {
                                corCalendario = "postitRasgadoAzul"
                            }
                    } else {
                        // Dia
                        Image("Afternoon")
                            .resizable()
                            .frame(maxWidth: 70,maxHeight: 70)
                            .frame(minWidth: 30,minHeight: 30)
                            .scaledToFit()
                            .padding(.top,-geo.size.height/45)
                            .onAppear {
                                corCalendario = "postitRasgadoVermelho"
                            }
                    }
                }.padding(.trailing, geo.size.width/10)
            }
        }
    }
}
