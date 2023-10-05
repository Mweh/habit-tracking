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
                ForEach(habits.items){ item in
                    NavigationLink{
                        Form{
                            VStack(alignment: .leading, spacing: 0){
                                Text(item.habit)
                                    .font(.largeTitle)
                                    .fontWeight(.bold)
                                Divider().frame(width: .infinity)
                                Text(item.description)
                                    .padding(.vertical)
                            }
                        }
                    } label: {
                        VStack{
                            HStack(){
                                VStack(alignment: .leading){
                                    Text(item.habit)
                                        .font(.headline)
                                        .padding(0.5)
                                    Text(item.description)
                                        .font(.caption)
                                        .frame(width: .infinity, height: 10, alignment: .leading)
                                }
                                Spacer()
                                Text("\(item.totalCompleted)")
                            }
                        }
                    }
                }
                .onDelete(perform: removeHabit)
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
    func removeHabit(at offsets: IndexSet){
        habits.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
