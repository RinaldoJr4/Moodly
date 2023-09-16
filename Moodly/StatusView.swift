//
//  StatusView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI


class MoodManager: ObservableObject {
    @Published var currentStatus = "sad"
}

struct StatusView: View {
    @Environment(\.dismiss) var presentation
    @EnvironmentObject var currentStatus: MoodManager
    
    @State var shouldShow = false
    @State var dictionaryStatus = ["sad":"😭", "happy":"🤩"]
    var status : String
    var body: some View {
        GeometryReader { geo in
            ZStack {
                
                Image("PostitInteiro")
                    .resizable()
                    .shadow(radius: geo.size.height/80)
                
                VStack {
                    HStack {

                        Text("Status")
                            .padding(.leading,geo.size.width/15)
                            .font(.custom("PumpkinCheesecakeRegular", size: 40))
                            .foregroundColor(.black)
                            .lineLimit(1)
                            .foregroundColor(.black)
                            .padding(.top,geo.size.height/8)
                            .padding(.bottom,-geo.size.height/15)
                            .minimumScaleFactor(0.6)
                        Spacer()
                    }
                    HStack {
                        //                    HStack {
                        //                        Text(currentStatus.currentStatus)
                        //                            .font(.title)
                        //                            .foregroundColor(.black)
                        //                            .minimumScaleFactor(0.8)
                        //                        Spacer()
                        //                    }.padding(.leading,geo.size.width/32)
                        //                        .frame(width: geo.size.width/2.2)
                        Image(currentStatus.currentStatus)
                            .resizable()
                            .frame(maxWidth: 70,maxHeight: 70)
                            .frame(minWidth: 50,minHeight: 50)
                            .scaledToFit()
                            .padding(.top,geo.size.height/8)
                            .padding(.bottom,geo.size.height/4)
                        //                    Text(dictionaryStatus[currentStatus.currentStatus]!)
                        //                        .font(.system(size: geo.size.width/2.8))
                        //                        .shadow(radius: geo.size.width/45)
                        //                        .minimumScaleFactor(0.8)
                    }
                }
            }.onTapGesture {
                shouldShow.toggle()
            }.sheet(isPresented: $shouldShow, content: {MoodView()})
        }
    }
}

class StatusManager {
    static let shared = StatusManager()
    private init() {}

    func updateStatus(with status: String) {
        // Code to update the status
        // You can save the status using @AppStorage or any other method you prefer
        // For example:
        // @AppStorage("status") var currentStatus = "Triste"
        // currentStatus = status
    }
}
