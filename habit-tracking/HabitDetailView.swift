//
//  HabitDetailView.swift
//  habit-tracking
//
//  Created by Muhammad Fahmi on 04/10/23.
//

import SwiftUI

struct HabitDetailView: View {
    @StateObject var habits = Habits()
    
    var body: some View {
        Form{
            VStack{
//                Text("\(habits.items)")
//                ForEach(habits.items){ item in
//                    Text(item.habit)
//                    Text(item.description)
//                }
            }
        }
    }
}

struct HabitDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HabitDetailView()
    }
}
