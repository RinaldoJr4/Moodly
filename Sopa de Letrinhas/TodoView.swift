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
    var index: Int
}

enum Sections: String, CaseIterable {
    case pending = "Pending"
    case completed = "Completed"
}

struct TodoView: View {
    
    //    @AppStorage("tasks") var tasksStored =  [Task(name: "teste1",isCompleted: false)].rawValue
    @State var tasks: [Task] = [Task(name: "teste1",isCompleted: false, index: 0)]
    @State var shouldShow = false
    //    @AppStorage("ids") var idsStored: [UUID] = [UUID()]
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]
    @State var count = 0
    
    
    var currentDate: Date
    
    var pendingTask: [Binding<Task>] {
        $tasks.filter { !$0.isCompleted.wrappedValue }
    }
    
    var completedTask: [Binding<Task>] {
        $tasks.filter { $0.isCompleted.wrappedValue }
    }
    
    var body: some View {
        GeometryReader { geo in
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
                                    count = namessStored.count-1
                                    for i in 0...count {
                                        if isDeletedsStored[i] && isDeletedsStored.count != 1 {
                                            namessStored.remove(at: i)
                                            isDeletedsStored.remove(at: i)
                                            isCompletedsStored.remove(at: i)
                                            creationDatesStored.remove(at: i)
                                            break
                                        }
                                        else if isDeletedsStored[i] && isDeletedsStored.count == 0 {
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
                        .frame(height: CGFloat(tasks.count) * 103)
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
                        .padding(.vertical,5)
                        .padding(.leading,geo.size.width/80)
                    Spacer()
                }.layoutPriority(2)
                Spacer().layoutPriority(2)
                    .onAppear {
                        tasks.removeFirst()
                        if namessStored == [] || isDeletedsStored == [] || isCompletedsStored == [] || creationDatesStored == [] {
                            namessStored = [""]
                            isDeletedsStored = [false]
                            isCompletedsStored = [false]
                            creationDatesStored = [Date()]
                        }
                        else if namessStored == [""] {
                            namessStored.removeFirst()
                            isDeletedsStored.removeFirst()
                            isCompletedsStored.removeFirst()
                            creationDatesStored.removeFirst()
                        }
                        else {
                            for i in 0...namessStored.count-1 {
                                if isDeletedsStored[i] {
                                    namessStored.remove(at: i)
                                    isDeletedsStored.remove(at: i)
                                    isCompletedsStored.remove(at: i)
                                    creationDatesStored.remove(at: i)
                                } else {
                                    tasks.append(Task(name: namessStored[i],isCompleted: isCompletedsStored[i],isDeleted: isDeletedsStored[i],creationDate: creationDatesStored[i], index: tasks.count))
                                }
                            }
                        }
                    }
            }.sheet(isPresented: $shouldShow, content: {MakeTaskView(tasks: $tasks, currentDate: currentDate)})
        }
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
            RoundedRectangle(cornerRadius: 16)
                .stroke(.black, lineWidth: 4)
                .foregroundColor(Color("Paper100"))
            HStack {
                Image(systemName: task.isCompleted ? "checkmark.square" : "square")
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.black)
                    .padding(.vertical,30)
                    .padding(.leading,24)
                Text("\(task.name)")
                    .foregroundColor(.black)
                    .font(.title2)
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
                        isDeletedsStored[task.index] = true
                    }
            }.padding(.leading, 10)
                .frame(height: 80)
        }.cornerRadius(16)
            .padding(.bottom,10)
            .onTapGesture {
                task.isCompleted.toggle()
                isCompletedsStored[task.index].toggle()
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
