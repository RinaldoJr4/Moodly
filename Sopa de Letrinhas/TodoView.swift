//
//  TodoView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 26/05/23.
//

import SwiftUI

struct Task: Identifiable, Equatable, Decodable, Encodable {
    var id = UUID()
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
    
//    @AppStorage("tasks") var tasksStored =  [Task(name: "teste1",isCompleted: false)].rawValue
    @State var tasks: [Task] = [Task(name: "teste1",isCompleted: false)]
    @State var shouldShow = false
//    @AppStorage("ids") var idsStored: [UUID] = [UUID()]
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]

    
    var currentDate: Date
    
    var pendingTask: [Binding<Task>] {
        $tasks.filter { !$0.isCompleted.wrappedValue }
    }
    
    var completedTask: [Binding<Task>] {
        $tasks.filter { $0.isCompleted.wrappedValue }
    }
    
    var body: some View {
        VStack {
            if tasks.count != 0 {
                List(Sections.allCases,id: \.self){ section in
                    ForEach(section == .pending ? pendingTask : completedTask){ $task in
                        TaskViewCell(task: $task)
                            .onChange(of: tasks) { newValue in
                                for task in tasks {
                                    if task.isDeleted {
                                        let taskToDelete = task
                                        tasks = tasks.filter { $0.id != taskToDelete.id }
                                    }
                                }
                                for i in 0...namessStored.count-1 {
                                    if isDeletedsStored[i] && isDeletedsStored.count != 1 {
                                        namessStored.remove(at: i)
                                        isDeletedsStored.remove(at: i)
                                        isCompletedsStored.remove(at: i)
                                        creationDatesStored.remove(at: i)
                                    }
                                    else if isDeletedsStored[i] && isDeletedsStored.count == 1 {
                                        namessStored = ["savestore"]
                                        isDeletedsStored = [false]
                                        isCompletedsStored = [false]
                                        creationDatesStored = [Date()]
                                        namessStored.remove(at: i)
                                        isDeletedsStored.remove(at: i)
                                        isCompletedsStored.remove(at: i)
                                        creationDatesStored.remove(at: i)
                                    }
                                }
                            }
                    }
                }.listStyle(.plain)
                    .frame(height: CGFloat(tasks.count) * 53)
                    .scrollContentBackground(.hidden)
                    .layoutPriority(2)
            }
            else {
                HStack {
                    Text("Você ainda não tem nenhuma atividade")
                        .font(.title2)
                        .foregroundColor(.gray)
                        .layoutPriority(2)
                        .padding()
                    Spacer()
                }
            }
            HStack {
                Button(action: {
                    shouldShow.toggle()
                }, label: {
                    HStack {
                        Image(systemName: "plus.circle")
                            .resizable()
                            .scaledToFit()
                            .foregroundColor(.gray)
                            .frame(width: 30,height: 30)
                        Text("Adicionar Task")
                            .foregroundColor(.gray)
                            .font(.title)
                    }
                }).buttonStyle(.borderless)
                    .padding(5)
                Spacer()
            }.layoutPriority(2)
            Spacer().layoutPriority(2)
                .onAppear {
                    tasks.removeFirst()
                    for i in 0...namessStored.count-1 {
                        if isDeletedsStored[i] {
                            namessStored.remove(at: i)
                            isDeletedsStored.remove(at: i)
                            isCompletedsStored.remove(at: i)
                            creationDatesStored.remove(at: i)
                        } else {
                            tasks.append(Task(name: namessStored[i],isCompleted: isCompletedsStored[i],isDeleted: isDeletedsStored[i],creationDate: creationDatesStored[i]))
                        }
                    }
                }
        }.sheet(isPresented: $shouldShow, content: {MakeTaskView(tasks: $tasks, currentDate: currentDate)})
    }
}


struct TaskViewCell : View {
    
    @Binding var task: Task
    
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]
    
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
                //                Image(systemName: "x.circle")
                //                    .resizable()
                //                    .scaledToFit()
                //                    .foregroundColor(.gray)
                //                    .padding(12)
                Text("X")
                    .foregroundColor(.gray)
                    .font(.title)
                    .padding(.trailing, 15)
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

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else {
            return nil
        }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}
