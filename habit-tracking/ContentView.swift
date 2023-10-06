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
                detailHabitView()
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
                Form{
                    VStack(alignment: .leading, spacing: 0){
                        Text(item.habit)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Divider().frame(maxWidth: .infinity)
                        Text(item.description)
                            .padding(.vertical)
                    }
                }
                .toolbar{
                    Button{
                        // do something
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
    static var previews: some View {
        ContentView()
    }
}
