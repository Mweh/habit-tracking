//
//  ContentView.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import SwiftUI

struct ContentView: View {
    @State var updatedHabit: HabitsItem
    @StateObject var habits = Habits()
    @State private var showHabitView = false
    @State private var habitTrackNumber = 0
    @State private var showMainView = true
    
    var body: some View {
        NavigationView{
            List{
                if showMainView{
                    detailHabitView()
                }
            }
            .onAppear(){
                showMainView = true
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
    
    func detailHabitView() -> some View {
        return ForEach(habits.items){ item in
            NavigationLink{
                VStack{
                    VStack(alignment: .leading, spacing: 0){
                        Text(item.habit)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Divider().frame(maxWidth: .infinity)
                            .padding(.vertical)
                        Text(item.description)
                            .padding(.vertical)
                    }
                    Divider().frame(maxWidth: .infinity)
                    HStack{
                        Text("Completed: \(habitTrackNumber) times")
                            .font(.caption)
                        Spacer()
                        Button("\(Image(systemName: "minus.square"))"){
                            (habitTrackNumber <= 0) ? (habitTrackNumber = 0) : (habitTrackNumber -= 1)
                        }
                        Button("\(Image(systemName: "plus.square"))"){
                            habitTrackNumber += 1
                        }
                    }
                }
                .padding()
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(lineWidth: 0.2)
                        .stroke(.black)
                )
                .padding()
                Spacer()
                    .toolbar{
                        Button{
                            // do something
                            //                        habitTrackNumber += 1+item.totalCompleted
                            ////                        data.activities[index] = newActivity
                            //                        item.totalCompleted[firstIndex(of: Habits().items)]
                            //                        updatedHabit.totalCompleted += 1
                            //                        if let index = habits.items.firstIndex(of: updatedHabit) {
                            //                            habits.items[index] = updatedHabit
                            //                        }
                            showMainView = false
                        } label: {
                            Text("Done")
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
                                .frame(maxWidth: .infinity)
                                .frame(height: 10, alignment: .leading)
                        }
                        Spacer()
                        Text("\(habitTrackNumber)")
                        //                                                Text("\(item.totalCompleted)")
                        //                        Text("\(updatedHabit.totalCompleted)")
                        
                    }
                }
            }
        }
        .onDelete(perform: removeHabit)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let sampleHabit = HabitsItem(habit: "Sample Habit", description: "This is a sample habit", totalCompleted: 0)
    static var previews: some View {
        ContentView(updatedHabit: sampleHabit)
    }
}
