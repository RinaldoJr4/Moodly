//
//  OnboardingView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 23/05/23.
//
import SwiftUI

struct OnboardingView: View {
    
    @Environment(\.presentationMode) var presentation
    @AppStorage("onboarding") var didOnboardingHappened = false
    @StateObject private var viewRouter = ViewRouter()

    var body: some View {
        VStack {
            if viewRouter.currentPage == 1 {
                CustomScreen(viewRouter: viewRouter, imageName: "happy", title: "Monitore suas emoções", buttonText: "Próximo", text:"Inicie e finalize seu dia registrando como você está se sentindo")
            } else if viewRouter.currentPage == 2 {
                CustomScreen(viewRouter: viewRouter, imageName: "CheckboxIcon", title: "Liste suas atividades", buttonText: "Próximo", text: "Tenha uma representação visual do seu planejamento diário")
            } else if viewRouter.currentPage == 3 {
                CustomScreen(viewRouter: viewRouter, imageName: "Thinking", title: "Tire um momento para reflexão", buttonText: "Concluir", text:"Receba notificações que te auxiliam nesse processo")
            }
        }
        .background(Color.white)
        .cornerRadius(10)
        .frame(width: 601, height: 488)
        .frame(maxWidth: 601, maxHeight: 488)
        .frame(minWidth: 601, minHeight: 488)
        .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.black, lineWidth: 1)
                )
    }
}

struct CustomScreen: View {
    @ObservedObject var viewRouter: ViewRouter
    let imageName: String
    let title: String
    let buttonText: String
    let text: String

    let currentStatus2: MoodManager = MoodManager()
    @StateObject var dataController = CoreDataViewModel()
    
    var body: some View {
        VStack {
            if viewRouter.currentPage != 3 {
                NavigationLink {
                    MainView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(currentStatus2)
                        .environment(\.managedObjectContext, dataController.container.viewContext)
                } label: {
                    Text("Pular")
                        .foregroundColor(.black)
                }.buttonStyle(.borderless)
                    .padding(.leading, 515)
                        .padding(.top, 20)
            }
            
            VStack{
                Image(imageName)
                    .frame(width: 311, height: 112)
                
                Text(title)
                    .foregroundColor(.black)
                    .padding(.bottom, 25)
                    
                Text(text)
                    .foregroundColor(.black)
            }.padding(.top, 80)
            
            Spacer()
            if viewRouter.currentPage < 3 {
                Button(action: {
                        viewRouter.currentPage += 1
                }, label: {
                    ZStack{
                        Image("ExtraLargeButton")
                        Text(buttonText)
                            .foregroundColor(.black)
                    }
                }).buttonStyle(.borderless)
                    .padding(.top, 80)
                    .padding(.bottom, 40)
            }
            else {
                NavigationLink {
                    MainView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(currentStatus2)
                        .environment(\.managedObjectContext, dataController.container.viewContext)
                } label: {
                    ZStack{
                        Image("ExtraLargeButton")
                        Text(buttonText)
                            .foregroundColor(.black)
                    }
                }.buttonStyle(.borderless)
                    .padding(.top, 80)
                    .padding(.bottom, 40)
            }
        }.padding(.horizontal, 20)
            .frame(width: 601, height: 488)
    }
}

class ViewRouter: ObservableObject {
    @Published var currentPage = 1
}

    

