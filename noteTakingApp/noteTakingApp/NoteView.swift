//
//  NoteView.swift
//  noteTakingApp
//
//  Created by StudentPM on 4/18/25.
//

import SwiftUI

struct NoteView: View {
    @State var note: Note // A variable that holds the note being viewed

    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text(note.title)
                .font(.title) // Display title of the note
                .fontWeight(.bold) // Bold text

            Text(note.content) // Display full content of the note
                .padding(.top, 10)

            Spacer() //push content to top
        }
        .padding()
        .navigationTitle("Note") // Title in navigation bar
    }
    
}
#Preview {
    NoteView(note: Note(title: "Sample Title", content: "Sample content for preview."))
}

