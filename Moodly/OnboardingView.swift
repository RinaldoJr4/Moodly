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
    
    @AppStorage("names") var namessStored : [String] = ["Teste Persistencia"]
    @AppStorage("isCompleteds") var isCompletedsStored : [Bool] = [false]
    @AppStorage("isDeleteds") var isDeletedsStored : [Bool] = [false]
    @AppStorage("creationDates") var creationDatesStored : [Date] = [Date()]

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.black, lineWidth: 1)
                .background(.white)
                .cornerRadius(10)
        VStack {
            if viewRouter.currentPage == 1 {
                CustomScreen(viewRouter: viewRouter, imageName: "happy", title: "Monitore suas emoções", buttonText: "Próximo", text:"Inicie e finalize seu dia registrando como\nvocê está se sentindo")
            } else if viewRouter.currentPage == 2 {
                CustomScreen(viewRouter: viewRouter, imageName: "CheckboxIcon", title: "Liste suas atividades", buttonText: "Próximo", text: "Tenha uma representação visual do seu\n  planejamento diário")
            } else if viewRouter.currentPage == 3 {
                CustomScreen(viewRouter: viewRouter, imageName: "Thinking", title: "Tire um momento para reflexão", buttonText: "Concluir", text:"Receba notificações que te auxiliam nesse\n  processo")
            }
        }
    }
        .frame(maxWidth: 900, maxHeight: 600)
        .onAppear{
            namessStored = ["Onboarding"]
            isDeletedsStored = [false]
            isCompletedsStored = [true]
            creationDatesStored = [Date()]
            
        }
    }
}

struct CustomScreen: View {
    @ObservedObject var viewRouter: ViewRouter
    let imageName: String
    let title: String
    let buttonText: String
    let text: String

    let currentStatus2: MoodManager = MoodManager()
    
    var body: some View {
        VStack {
            if viewRouter.currentPage != 3 {
                NavigationLink {
                    MainView()
                        .navigationBarBackButtonHidden()
                        .environmentObject(currentStatus2)
                } label: {
                    Text("Pular")
                        .foregroundColor(.black)
                        .font(.custom("SFPro", size: 14))
                        .padding(.leading, 515)
                        .padding(.top, 20)
                }.buttonStyle(.borderless)
                
            }
            VStack{
                VStack{
                    
                    Image(imageName)
                        .frame(width: 311, height: 112)
                    
                    Text(title)
                        .padding(.bottom, 20)
                        .font(.custom("PumpkinCheesecakeRegular", size: 30))
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.8)
                    
                  Text(text)
                        .frame(width: 400, height: 70)
                        .font(.custom("SFPro", size: 24))
                        .multilineTextAlignment(.center)
                        .foregroundColor(.black)
                        .minimumScaleFactor(0.8)
                    
                }.padding(.bottom, 50)
                
               
                if viewRouter.currentPage < 3 {
                    Button(action: {
                        viewRouter.currentPage += 1
                    }, label: {
                        ZStack{
                            Image("ExtraLargeButton")
                            Text(buttonText)
                                .font(.custom("SFPro", size: 17))
                                .minimumScaleFactor(0.8)
                                .foregroundColor(.black)
                        }
                    }).buttonStyle(.borderless)
                        .padding(.bottom, 40)
                }
                else {
                    NavigationLink {
                        MainView()
                            .navigationBarBackButtonHidden()
                            .environmentObject(currentStatus2)
                    } label: {
                        ZStack{
                            Image("ExtraLargeButton")
                            Text(buttonText)
                                .font(.custom("SFPro", size: 17))
                                .minimumScaleFactor(0.8)
                                .foregroundColor(.black)
                        }
                    }.buttonStyle(.borderless)
                }
            }.padding(.top, 50)
        }.padding(.horizontal, 20)
            .frame(width: 601, height: 488)
    }
}

class ViewRouter: ObservableObject {
    @Published var currentPage = 1
}

    

