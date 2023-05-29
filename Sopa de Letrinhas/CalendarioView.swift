//
//  CalendarioView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct  CalendarioView: View {
    
    @State var size = CGSize()
    
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
                        .minimumScaleFactor(0.7)
                        .padding(.leading,geo.size.width/15)
                    Spacer()
                }
                .padding(.top,geo.size.height/8)
                
                if ((Int(formatter.string(from: today)) ?? 0) <= 11) {
                    // Madrugada
                    Rectangle().foregroundColor(.orange)
                        .padding(.top,-10)
                } else if ((Int(formatter.string(from: today)) ?? 0) >= 18){
                    // Noite
                    Rectangle().foregroundColor(.blue)
                        .padding(.top,-10)
                } else {
                    // Dia
                    Rectangle().foregroundColor(.yellow)
                        .padding(.top,-10)
                }
            }
        }
    }
}
