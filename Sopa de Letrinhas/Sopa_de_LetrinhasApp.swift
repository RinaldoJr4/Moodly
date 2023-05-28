//
//  Sopa_de_LetrinhasApp.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 03/05/23.
//

import SwiftUI

@main
struct Sopa_de_LetrinhasApp: App {
    
    @StateObject var vm = CoreDataViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA: \(error)")
            }
            else {
                print("Successfully loaded Data!")
            }
        }
    }
}
