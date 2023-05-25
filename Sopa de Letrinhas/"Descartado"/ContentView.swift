//
//  ContentView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 03/05/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    @State var name = ""
    @AppStorage("onboarding") var didOnboardingHappend = false
    
    var body: some View {
        NavigationView{
            VStack(alignment: .leading) {
                
                Text("Opções").fontWeight(.heavy).padding(.leading,15)
                
                List(selection: $viewModel.selectedId) {
                    ForEach(viewModel.fruits) { item in
                        NavigationLink(item.name, tag: item.id, selection: $viewModel.selectedId) {
                            VStack{
                                
                                if name == "Calendar" {
                                    MainView()
                                }
//                                else if name == "To-do"{
//                                    ToDoView()
//                                }
//                                else {
//                                    ReflexView()
//                                }
                                
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
            // Para caso a SideBar tenha sido fechada inicialmente pelo usuário
            MainView()
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .onAppear(){
            didOnboardingHappend = true
            
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
