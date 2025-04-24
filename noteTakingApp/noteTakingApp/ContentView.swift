//
//  ContentView.swift
//  noteTakingApp
//
//  Created by StudentPM on 4/17/25.
//

import SwiftUI

struct ContentView: View {
    @State private var notes: [Note] = [] // State variable to store the list of notes

    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(notes) { note in // Loop through each note
                        NavigationLink(destination: NoteView(note: note)) { // Navigate to the "NoteView" file when tapped
                            VStack() {
                                Text(note.title).fontWeight(.bold) // bold title
                                Text(note.content) // Display preview of note content
//                                    .lineLimit(1)
                                    .font(.subheadline) // Smaller font for content
                                    .foregroundColor(.gray) // Gray color for content preview
                            } 
                        }
                    }
                }

                NavigationLink(destination: CreateNoteView(notes: $notes)) { // Button to navigate to the "CreateNoteView" file
                    Text("Add Task") // Button text
                        .frame(maxWidth: .infinity) // Make the button full width
                        .padding()
                        .background(Color.blue) //blue background
                        .foregroundColor(.white) // white color
                        .font(.system(size: 30)) // font size
                }

            }
            .navigationTitle("Notes") // title of NavBar
        }
    }
}

#Preview {
    ContentView()
}
