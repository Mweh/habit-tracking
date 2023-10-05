//
//  AddHabit.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import SwiftUI

struct AddHabitView: View {
    @ObservedObject var habits: Habits
    
    @Environment(\.dismiss) var dismiss
    
    @State private var addTitle = ""
    @State private var addDescription = ""
    @State private var totalCompleted = 0
    
    var body: some View {
        NavigationView{
            Form{
                TextField("Title", text: $addTitle)
                TextField("Description", text: $addDescription)
            }
            .toolbar{
                ToolbarItem{
                    Button("Save"){
                        //                            habitNumber += 1
                        let habit = HabitsItem(habit: addTitle, description: addDescription, totalCompleted: totalCompleted)
                        habits.items.append(habit)
                        dismiss()
                    }
                }
            }
            .navigationTitle("Add New Habit")
        }
    }
}

struct AddHabit_Previews: PreviewProvider {
    static var previews: some View {
        AddHabitView(habits: Habits())
    }
}
