//
//  CalendarioView.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 25/05/23.
//

import SwiftUI

struct MainView: View {
    
    @AppStorage("onboarding") var didOnboardingHappend = false
    
    @State var shouldShow = false
    @State var birthDate = Date.now
        
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                
                ZStack {
                    Rectangle().foregroundColor(Color("Cortica100"))
                    
                    Image("CorticaBackground")
                        .resizable()
                        .scaledToFill()
                }
                .frame(width: geo.size.width,height: geo.size.height)
                
                HStack{
                    ZStack{
                        Rectangle().foregroundColor(.white)
                            .cornerRadius(16)
                        Rectangle().foregroundColor(Color("Papel80"))
                            .cornerRadius(16)
                        BoardView()
                    }
                    .frame(width: geo.size.width/1.38)
                    VStack{

                        CalendarioView()
                        .frame(height: geo.size.height/5)
                            .padding(.bottom,geo.size.height/30)
                        
                        StatusView(status: "tô triste")
                        .padding(.vertical,geo.size.height/30)
                           
                        LembretesView()
                        .padding(.top,geo.size.height/30)
                        
                    }.padding(.leading,geo.size.width/30)
                }.padding(geo.size.height/22.5)
                    .sheet(isPresented: $shouldShow, content: {OnboardingView()})
                
            }.onAppear(){
                if !didOnboardingHappend {
                    shouldShow.toggle()
                }
            }
        }.frame(minWidth: 900,minHeight: 562.5)
            .overlay {
                overlayView()
            }
    }
}

struct overlayView: View {
        
    var body: some View {
        GeometryReader{ geo in
            ZStack {
                
                Spacer()
                    .frame(width: geo.size.width,height: geo.size.height)
                
                HStack{
                    Spacer()
                        .frame(width: geo.size.width/1.38)
                    VStack{
                        ZStack {
                            VStack {
                                Image("Clip")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.height/13, height: geo.size.height/13)
                                    .padding(.top, -geo.size.height/19)
                                Spacer()
                            }
                            Spacer()
                                .frame(height: geo.size.height/5)
                                .padding(.bottom,geo.size.height/30)
                        }
                        ZStack{
                            VStack{
                                Image("Clip")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.height/13, height: geo.size.height/13)
                                    .padding(.top, -geo.size.height/13)
                                Spacer()
                            }
                            Spacer().padding(.vertical,geo.size.height/30)
                        }
                        ZStack{
                            VStack{
                                Image("Clip")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: geo.size.height/13, height: geo.size.height/13)
                                    .padding(.top, -geo.size.height/24)
                                Spacer()
                            }
                            Spacer()
                                .padding(.top,geo.size.height/30)
                        }
                    }.padding(.leading,geo.size.width/30)
                }.padding(geo.size.height/22.5)
            }
        }.onAppear() {
            
        }
    }
}

import UserNotifications

struct NotificationView: View {
    
    let un = UNUserNotificationCenter.current()
    
    var body: some View {
        
        Button("Notify", action: {
            
            var dateComponents = DateComponents()
                dateComponents.hour = 14
                dateComponents.minute = 55
            
            // Request authorization
            un.requestAuthorization(options: [.alert, .sound]) { authorized, error in
                if authorized {
                    print("Authorized")
                } else if !authorized {
                    print("Not authorized")
                } else {
                    print(error?.localizedDescription as Any)
                }
            }
            
            un.getNotificationSettings { (settings) in
                if settings.authorizationStatus == .authorized {
                    let content = UNMutableNotificationContent()
                    
                    content.title = "Barbie World"
                    content.subtitle = "This is a subtitle"
                    content.body = "This is the body text"
                    content.sound = UNNotificationSound.default
                    content.categoryIdentifier = "barbieCoins"
                    
                    let id = "Test"
                    let filePath = Bundle.main.path(forResource: "barbie", ofType: ".png")
                    let fileURL = URL(fileURLWithPath: filePath!)
                    
                    do {
                        let attachment = try UNNotificationAttachment.init(identifier: "Another test", url: fileURL, options: .none)
                        
                        content.attachments = [attachment]
                    } catch let error {
                        print(error.localizedDescription)
                    }
                    
                    let buy = UNNotificationAction(identifier: "buy", title: "Buy", options: [.foreground])
                    let sell = UNNotificationAction(identifier: "sell", title: "Sell", options: [.foreground])
                    let hodl = UNNotificationAction(identifier: "hodl", title: "Hodl", options: [.foreground])
                    
                    
                    let category = UNNotificationCategory(identifier: "barbieCoins", actions: [buy, sell, hodl], intentIdentifiers: [], options: [])
                    
                    let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                    
                    let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                    
                    self.un.setNotificationCategories([category])
                    
                    self.un.add(request) { (error) in
                        if error != nil { print(error?.localizedDescription as Any)}
                    }
                }
            }
        })
    }
}
