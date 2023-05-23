//
//  Sopa_de_LetrinhasApp.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 03/05/23.
//

import SwiftUI

@main
struct Sopa_de_LetrinhasApp: App {
    
    @AppStorage("onboarding") var didOnboardingHappend = false
    
    var body: some Scene {
        WindowGroup {
            if didOnboardingHappend {
                ContentView()
            }
            else {
                OnboardingView()
            }
        }
    }
}

