//
//  habit_trackingApp.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import SwiftUI

@main
struct habit_trackingApp: App {
    let sampleHabit = HabitsItem(habit: "Sample Habit", description: "This is a sample habit", totalCompleted: 0)

    var body: some Scene {
        WindowGroup {
            ContentView(updatedHabit: sampleHabit)
        }
    }
}
