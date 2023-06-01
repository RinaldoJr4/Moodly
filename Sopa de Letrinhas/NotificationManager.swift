//
//  NotificationManager.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 31/05/23.
//

import NotificationCenter
import UserNotifications

class NotificationManager {
    
    private let un = UNUserNotificationCenter.current()

    func reflexNotificationOn() {
        
        print("ligou notificação de reflex")
        
        var dateComponents = DateComponents()
            dateComponents.hour = 18
//            dateComponents.minute = 00
        
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
            
            let id = "Reflexao"
            
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                
                content.title = "Reflita"
                content.subtitle = "Que tal dar uma paradinha para refletir?"
                content.body = "This is the body text"
                content.sound = UNNotificationSound.default
                content.categoryIdentifier = "barbieCoins"
                
/*                    let filePath = Bundle.main.path(forResource: "Logo", ofType: ".png")
                let fileURL = URL(fileURLWithPath: filePath!)

                do {
                    let attachment = try UNNotificationAttachment.init(identifier: "Another test", url: fileURL, options: .none)

                    content.attachments = [attachment]
                } catch let error {
                    print(error.localizedDescription)
                }c */
                
                let irPara = UNNotificationAction(identifier: "irPara", title: "Ir para o App", options: [.foreground])
                
                
                let category = UNNotificationCategory(identifier: "barbieCoins", actions: [irPara], intentIdentifiers: [], options: [])
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                self.un.setNotificationCategories([category])
                
                self.un.add(request) { (error) in
                    if error != nil { print(error?.localizedDescription as Any)}
                }
            }
        }
    }
    
    func reflexNotificationOff(){
        
        print("desligou notificação de reflex")

        self.un.removePendingNotificationRequests(withIdentifiers: ["Reflexao"])
    }
    
    func descansoNotificationOn() {
        
        print("ligou notificação de descanso")
        
        var dateComponents = DateComponents()
            dateComponents.hour = 12
            dateComponents.minute = 30
        
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
            
            let id = "Descanso"
            
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                
                content.title = "Reflita"
                content.subtitle = "Que tal dar uma paradinha para refletir?"
                content.body = "This is the body text"
                content.sound = UNNotificationSound.default
                content.categoryIdentifier = "barbieCoins"
                
/*                    let filePath = Bundle.main.path(forResource: "Logo", ofType: ".png")
                let fileURL = URL(fileURLWithPath: filePath!)

                do {
                    let attachment = try UNNotificationAttachment.init(identifier: "Another test", url: fileURL, options: .none)

                    content.attachments = [attachment]
                } catch let error {
                    print(error.localizedDescription)
                }c */
                
                let irPara = UNNotificationAction(identifier: "irPara", title: "Ir para o App", options: [.foreground])
                
                
                let category = UNNotificationCategory(identifier: "barbieCoins", actions: [irPara], intentIdentifiers: [], options: [])
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                self.un.setNotificationCategories([category])
                
                self.un.add(request) { (error) in
                    if error != nil { print(error?.localizedDescription as Any)}
                }
            }
        }
    }
    
    func descansoNotificationOff(){
        
        print("desligou notificação de descanso")
        
        self.un.removePendingNotificationRequests(withIdentifiers: ["Descanso"])
    }
    
    func dormirNotificationOn() {
        
        print("ligou notificação de dormir")
        
        var dateComponents = DateComponents()
            dateComponents.hour = 21
            dateComponents.minute = 30
        
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
            
            let id = "Dormir"
            
            if settings.authorizationStatus == .authorized {
                let content = UNMutableNotificationContent()
                
                content.title = "Reflita"
                content.subtitle = "Que tal dar uma paradinha para refletir?"
                content.body = "This is the body text"
                content.sound = UNNotificationSound.default
                content.categoryIdentifier = "barbieCoins"
                
/*                    let filePath = Bundle.main.path(forResource: "Logo", ofType: ".png")
                let fileURL = URL(fileURLWithPath: filePath!)

                do {
                    let attachment = try UNNotificationAttachment.init(identifier: "Another test", url: fileURL, options: .none)

                    content.attachments = [attachment]
                } catch let error {
                    print(error.localizedDescription)
                }c */
                
                let irPara = UNNotificationAction(identifier: "irPara", title: "Ir para o App", options: [.foreground])
                
                
                let category = UNNotificationCategory(identifier: "barbieCoins", actions: [irPara], intentIdentifiers: [], options: [])
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(identifier: id, content: content, trigger: trigger)
                
                self.un.setNotificationCategories([category])
                
                self.un.add(request) { (error) in
                    if error != nil { print(error?.localizedDescription as Any)}
                }
            }
        }
    }
    
    func dormirNotificationOff(){
        
        print("desligou notificação de dormir")
        
        self.un.removePendingNotificationRequests(withIdentifiers: ["Dormir"])
    }
    
}
