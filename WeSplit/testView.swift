//
//  testView.swift
//  WeSplit
//
//  Created by Gerrit Roska on 11/11/25.

import SwiftUI

struct testView: View {
    @State private var tapCount = 0 // ① Store state outside
    let students = ["Marry", "Tom", "Jerry"]
    @State private var selectedStudent = "Tom"
    @State private var name = ""
    
    var body: some View {
        // How to add navigation bar
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("Enter your name", text: $name)
                        Text("Your name is \(name)")
                    }
                    
                    Button("Tap count: \(tapCount)") {
                        tapCount += 1
                    }
                    .buttonStyle(.borderedProminent)
                    .padding()
                    
                    Section {
                        Text("Yes, I like cats")
                        Text("Good")
                        Text("Really bad")
                    }
                    
                    Section {
                        Picker("Select your student", selection: $selectedStudent) {
                            ForEach(students, id: \.self) {
                                Text($0)
                            }
                        }
                    }
                }
            }
            // 👇 Attach these here, not inside the Form or VStack
            .navigationTitle("WeSplit")
        }
    }
}

#Preview {
    ContentView()
}

// Safe area gives the exact area under the dynamic island and the home line.
// SwiftUI views are a function of your app's state.
