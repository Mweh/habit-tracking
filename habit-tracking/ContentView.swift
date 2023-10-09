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
                    showHabitView.toggle()
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
            let index = habits.items.firstIndex(of: item) ?? 0 // Default to 0 if not found
            
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
                        Text("Completed: \(item.totalCompleted) times")
                            .font(.caption)
                        Spacer()
                        Button("\(Image(systemName: "minus.square"))"){
                            (item.totalCompleted <= 0) ? (habits.items[index].totalCompleted = 0) : (habits.items[index].totalCompleted -= 1)
                        }
                        Button("\(Image(systemName: "plus.square"))"){
                            habits.items[index].totalCompleted += 1
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
                            showMainView.toggle()
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
                        Text("\(item.totalCompleted)")
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
        ContentView()
    }
}
