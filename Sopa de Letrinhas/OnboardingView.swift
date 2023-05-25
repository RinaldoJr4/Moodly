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
                Rectangle().frame(width: 500, height: 500).foregroundColor(.gray)
                
                VStack{
                    Text("Onboarding oi como vai")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                        .font(.title)
                    
                    Button(action: {
                        presentation.wrappedValue.dismiss()
                        didOnboardingHappend.toggle()
                    }, label: {
                        ZStack {
                            Rectangle().frame(width: 100, height: 50)
                                .cornerRadius(16)
                            Text("SAI!")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                        }
                    }).buttonStyle(.borderless)
                    
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
