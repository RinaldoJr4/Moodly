//
//  OnboardingView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 23/05/23.
//

import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentation
    @AppStorage("onboarding") var didOnboardingHappend = false

    
    var body: some View {
        NavigationStack {
            ZStack{
                Rectangle().frame(width: 500, height: 500).foregroundColor(.black)
                
                VStack{
                    Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    
                    Button("Sair", action: {
                        presentation.wrappedValue.dismiss()
                        didOnboardingHappend.toggle()
                    })
                    
                }
            }
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
