//
//  TodoView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 26/05/23.
//

import SwiftUI

struct Task: Identifiable {
    let id = UUID()
    let name: String
    var isCompleted = false
}

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct TodoView: View {
    
//    @AppStorage("tasks") var tasksStored : [String] = [""]
    @State var tasks: [Task] = [Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false),Task(name: "teste",isCompleted: false)]
    
    var pendingTask: [Binding<Task>] {
        $tasks.filter { !$0.isCompleted.wrappedValue }
    }
    
    var completedTask: [Binding<Task>] {
        $tasks.filter { $0.isCompleted.wrappedValue }
    }
    
    var body: some View {
        VStack {
            List(Sections.allCases,id: \.self){ section in
                ForEach(section == .pending ? pendingTask : completedTask){ $task in
                    TaskViewCell(task: $task)
                        .onTapGesture {
                            task.isCompleted.toggle()
                        }
                }
            }.listStyle(.plain)
                .frame(height: CGFloat(tasks.count) * 53)
                .scrollContentBackground(.hidden)
                .layoutPriority(2)
            HStack {
                Button(action: {
                    
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(width: 40,height: 40)
                        Text("Adicionar Task")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }).buttonStyle(.borderless)
                    .padding(5)
                Spacer()
            }.layoutPriority(2)
            Spacer().layoutPriority(2)
        }
    }
}


struct TaskViewCell : View {
    
    @Binding var task: Task
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(.white)
            HStack {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .padding(.vertical,12)
                Text(task.name)
                    .foregroundColor(.black)
                    .font(.title)
                    .strikethrough(task.isCompleted,color: .black)
                    .padding(.leading, 10)
                Spacer()
            }.padding(.leading, 10)
                .frame(height: 45)
        }.border(.black,width: 2)
    }
}



struct TodoView_Previews: PreviewProvider {
    static var previews: some View {
        TodoView()
    }
}
