//
//  MakeTaskView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 27/05/23.
//

import SwiftUI

struct MakeTaskView: View {
    
    @Environment(\.presentationMode) var presentation
    @Binding var tasks: [Task]
    @State var taskName = ""
    var currentDate: Date
    
    var body: some View {
        ZStack {
            
            Rectangle().foregroundColor(.white)
            
            VStack {
                HStack {
                    Spacer()
                    Button {
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Text("X")
                            .font(.title)
                            .bold()
                    }.buttonStyle(.borderless)
                }.padding()
                Spacer()
            }
            
            VStack {
                Text("Status")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                TextField("escreva o nome da tarefa...", text: $taskName)
                    .foregroundColor(.black)
                    .padding()
                    .border(.black,width: 2)
                    .frame(width: 300,height: 50)
                    .textFieldStyle(.plain)
                    .preferredColorScheme(.light)
                Spacer()
                Button(action: {
                    if taskName != "" {
                        presentation.wrappedValue.dismiss()
                        tasks.append(Task(name: taskName,creationDate: currentDate))
                    }
                }, label: {
                    ZStack {
                        Rectangle().foregroundColor(.blue).frame(width: 200,height: 50)
                            .cornerRadius(15)
                        Text("Criar task")
                            .font(.title2)
                            .bold()
                            .foregroundColor(.white)
                    }
                }).buttonStyle(.borderless)
            }.padding(40)
        }
        .frame(width: 500,height: 300)
        
    }
}

