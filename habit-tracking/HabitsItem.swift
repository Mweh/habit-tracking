//
//  HabitsItem.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import Foundation

struct HabitsItem: Identifiable, Codable {
    var id = UUID()
    let habit: String
    let description: String
    let totalCompleted: Int
}
