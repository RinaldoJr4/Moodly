//
//  TodoView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 26/05/23.
//

import SwiftUI

struct Task: Identifiable, Equatable {
    let id = UUID()
    let name: String
    var isCompleted = false
    var isDeleted = false
    var creationDate = Date()
}

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct TodoView: View {
    
    //    @AppStorage("tasks") var tasksStored : [String] = [""]
    @State var tasks: [Task] = [Task(name: "teste1",isCompleted: false)]
    @State var shouldShow = false
    
    var currentDate: Date
    
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
                    TaskViewCell(task: $task).onChange(of: tasks) { newValue in
                        for task in tasks {
                            if task.isDeleted {
                                let taskToDelete = task
                                tasks = tasks.filter { $0.id != taskToDelete.id }
                            }
                        }
                    }
                }
            }.listStyle(.plain)
                .frame(height: CGFloat(tasks.count) * 53)
                .scrollContentBackground(.hidden)
                .layoutPriority(2)
            HStack {
                Button(action: {
                    shouldShow.toggle()
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
        }.sheet(isPresented: $shouldShow, content: {MakeTaskView(tasks: $tasks, currentDate: currentDate)})
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
                Text("\(task.name)")
                    .foregroundColor(.black)
                    .font(.title)
                    .strikethrough(task.isCompleted,color: .black)
                    .padding(.leading, 10)
                Spacer()
                Image(systemName: "x.circle")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
                    .padding(12)
                    .onTapGesture {
                        task.isDeleted.toggle()
                    }
            }.padding(.leading, 10)
                .frame(height: 45)
        }.border(.black,width: 2)
            .onTapGesture {
                task.isCompleted.toggle()
            }
    }
}

