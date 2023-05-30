//
//  MoodView.swift
//  Sopa de Letrinhas
//
//  Created by livia on 30/05/23.
//

import SwiftUI

struct MoodView: View {
    @State var isHover0 = false
    @State var isHover1 = false
    @State var isHover2 = false
    @State var isHover3 = false
    @State var isHover4 = false
    
//    var moods = ["😄","😔","😠","😰","😐"]
    
    var body: some View {
        ZStack{
            Rectangle().frame(width: 500, height: 500).foregroundColor(.white)
            
            VStack {
                
                Text("Status")
                    .font(.title)
                    .padding(.top)
                    .fontWeight(.bold)
                    Spacer()
                
//                HStack {
//                    ForEach(moods.indices, id: \.self) { index in
//                        Button (self.moods[index], action: {})
//                        .buttonStyle(.borderless)
//                        .font(.system(size: 70))
//                        .scaleEffect(isHover0 ? 1.5 : 1)
//                        .onHover {hover in
//                            withAnimation(.spring()){
//                                 isHover0 = hover
//                            }
//                        }
//                    }
//                }
                
                HStack {
                    ZStack {
//                        Circle().foregroundColor(.brown)
//                            .frame(width: 75)
//
                        Button ("😄", action: {
                            Image("happy")
                            print ("Feliz")
                        })
                        .buttonStyle(.borderless)
                        .font(.system(size: 70))
                        .scaleEffect(isHover0 ? 1.5 : 1)
                        .onHover {hover in
                            withAnimation(.spring()){
                                 isHover0 = hover
                            }
                    }
                    }
                    
                    Button ("😔", action: {
                        print ("Triste")
                    })
                    .buttonStyle(.borderless)
                    .font(.system(size: 70))
                    .scaleEffect(isHover1 ? 1.5 : 1)
                    .onHover {hover in
                        withAnimation(.spring()){
                             isHover1 = hover
                        }
                    }
                    
                    Button ("😠", action: {
                        print ("Irritado")
                    })
                    .buttonStyle(.borderless)
                    .font(.system(size: 70))
                    .scaleEffect(isHover2 ? 1.5 : 1)
                    .onHover {hover in
                        withAnimation(.spring()){
                             isHover2 = hover
                        }
                    }
                    
                    Button ("😰", action: {
                        print ("Ansioso")
                    })
                    .buttonStyle(.borderless)
                    .font(.system(size: 70))
                    .scaleEffect(isHover3 ? 1.5 : 1)
                    .onHover {hover in
                        withAnimation(.spring()){
                             isHover3 = hover
                        }
                    }
                    
                    Button ("😐", action: {
                        print ("Neutro")
                    })
                    .buttonStyle(.borderless)
                    .font(.system(size: 70))
                    .scaleEffect(isHover4 ? 1.5 : 1)
                    .onHover {hover in
                        withAnimation(.spring()){
                             isHover4 = hover
                        }
                    }
                    
                }
                
                Spacer()
                
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.")
                    .padding(.bottom, 100)
                    .padding(.horizontal)
            }
        }
    }
    
}

struct MoodView_Previews: PreviewProvider {
    static var previews: some View {
        MoodView()
    }
}
