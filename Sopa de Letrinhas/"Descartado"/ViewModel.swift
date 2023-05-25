//
//  Teste.swift
//  Sopa de Letrinhas
//
//  Created by rsbj on 23/05/23.
//

import Foundation
import SwiftUI

struct Fruit: Identifiable {
    let id = UUID().uuidString
    let name: String
}

final class ViewModel: ObservableObject {
    init(fruits: [Fruit] = ViewModel.defaultFruits) {
        self.fruits = fruits
        self.selectedId = fruits[0].id
    }
    @Published var fruits: [Fruit]
    @Published var selectedId: String?
    static let defaultFruits: [Fruit] = ["Calendar", "To-do","Reflex"].map({ Fruit(name: $0) })
}
