//
//  Habits.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import Foundation

class Habits: ObservableObject{
    @Published var items = [HabitsItem](){
        didSet{
            if let encode = try? JSONEncoder().encode(items){
                UserDefaults.standard.set(encode, forKey: "Habits")
            }
        }
    }
    init(){
        if let savedHabits = UserDefaults.standard.data(forKey: "Habits"){
            if let decodeHabits = try? JSONDecoder().decode([HabitsItem].self, from: savedHabits){
                items = decodeHabits
                return
            }
        }
        items = []
    }
}
