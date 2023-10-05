//
//  ContentView.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject var habits = Habits()
    @State private var showHabitView = false
    @State private var habitTrackNumber = 0
    
    var body: some View {
        NavigationView{
            List{
                HabitDetailView()
            }
            .navigationTitle("Habit-tracking App")
            .toolbar{
                Button{
                    showHabitView = true
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showHabitView){
                AddHabitView(habits: habits)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
