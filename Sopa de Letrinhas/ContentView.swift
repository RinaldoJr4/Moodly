//
//  ContentView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 03/05/23.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        VStack {
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundColor(.accentColor)
//            Text("Hello, world!")
//        }
//        .padding()
//    }
//}

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var name = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Opções").fontWeight(.heavy).padding(.leading,15)
            
            List(selection: $viewModel.selectedId) {
                ForEach(viewModel.fruits) { item in
                    NavigationLink(item.name, tag: item.id, selection: $viewModel.selectedId) {
                        VStack{
                            
                            if name == "Calendar" {
                                CalendarioView()
                            }
                            else if name == "To-do"{
                                ToDoView()
                            }
                            else {
                                ReflexView()
                            }
                            
                            //                            Text(item.name)
                            //                                .navigationTitle(item.name)
                            
                        }.onAppear(){
                            name = item.name
                        }
                    }
                }
            }
        }
        .listStyle(.sidebar)
        .toolbar {
            ToolbarItem(placement: .automatic) {
                Button(action: toggleSidebar, label: { // 1
                    Image(systemName: "sidebar.leading")
                })
            }
        }
    }
    
    private func toggleSidebar() { // 2
        #if os(iOS)
        #else
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
        #endif
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
