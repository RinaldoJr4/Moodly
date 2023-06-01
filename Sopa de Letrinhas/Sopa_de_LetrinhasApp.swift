//
//  Sopa_de_LetrinhasApp.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 03/05/23.
//

import SwiftUI

@main
struct Sopa_de_LetrinhasApp: App {
    
    @StateObject var dataController = CoreDataViewModel()
    
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]
    
    let currentStatus2: MoodManager = MoodManager()

    @AppStorage("onboarding") var didOnboardingHappened = false

    
    var body: some Scene {
        WindowGroup {
            NavigationStack{
                if didOnboardingHappened {
                    MainView()
                        .environmentObject(currentStatus2)
                        .environment(\.managedObjectContext, dataController.container.viewContext)
                }
                else {
                    OnboardingView()
                }
            }
        }
    }
}

class CoreDataViewModel: ObservableObject {
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "Moodly")
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
