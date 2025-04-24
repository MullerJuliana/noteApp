//
//  CreateNoteView.swift
//  noteTakingApp
//
//  Created by StudentPM on 4/18/25.
//

import SwiftUI // Import SwiftUI framework

// Note struct with Identifiable conformance so it can be used in ForEach
struct Note: Identifiable {
    var id = UUID() // Unique identifier for each note
    var title: String // Title of the note
    var content: String // Content of the note
}

struct CreateNoteView: View {
    @Binding var notes: [Note] // Bind to the shared notes array so we can add new notes
    @State private var title = "" // Store user input for title
    @State private var content = "" // Store user input for content
    @Environment(\.dismiss) var dismiss // Used to dismiss the view when done

    var body: some View {
        VStack() { 
            TextField("Title", text: $title) // Input field for the note title
                .padding() // Padding inside the field
                .background(Color(UIColor.systemGray6)) // Light gray background
                .cornerRadius(8) // Rounded corners

            TextEditor(text: $content) // Multiline text editor for note content
                .padding() // Padding inside the editor
                .background(Color(UIColor.systemGray6)) // Light gray background
                .cornerRadius(8) // Rounded corners

            Button("Add Note") { // Button to save the note
                if !title.trimmingCharacters(in: .whitespaces).isEmpty &&
                    !content.trimmingCharacters(in: .whitespaces).isEmpty { // Ensure fields aren't empty
                    notes.append(Note(title: title, content: content)) // Add new note to the list
                    dismiss() // Dismiss the view and go back
                }
            }
            .disabled(title.isEmpty || content.isEmpty) // Disable button if fields are empty
            .padding() // Padding around the button
            .background((title.isEmpty || content.isEmpty) ? Color.gray : Color.blue) // Gray if disabled, blue if enabled
            .foregroundColor(.white) // White text color
            .cornerRadius(10) // Rounded corners
        }
        .padding() // Padding around the whole view
        .navigationTitle("New Note") // navigation title
    }
}

#Preview {
    NavigationView {
        CreateNoteView(notes: .constant([]))
    }
}
