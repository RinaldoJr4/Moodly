//
//  MoodlyApp.swift
//  Moodly
//
//  Created by rsbj on 16/09/23.
//

import SwiftUI

@main
struct MoodlyApp: App {
        
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

                }
                else {
                    OnboardingView()
                }
            }
        }
    }
}

