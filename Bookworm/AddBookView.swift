//
//  AddBookView.swift
//  Bookworm
//
//  Created by Владислав on 17.12.2023.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var genre = "Fantasy"
    @State private var review = ""
    @State private var rating = 3
    
    let genres = ["Thriller", "Mystery", "Fantasy", "Horror"]
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Name of book", text: $title)
                    TextField("Author name", text: $author)
                    
                    Picker("Genre", selection: $genre) {
                        ForEach(genres, id: \.self) {
                            Text($0)
                        }
                    }
                }
                
                Section("Write a review") {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                    
                }
                
                Section {
                    Button("Save the book") {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating, date: .now)
                        modelContext.insert(newBook)
                        dismiss()
                    }
                }
                .disabled(title.isEmpty || author.isEmpty)
            }
            .navigationTitle("Add Book")
        }
    }
}

#Preview {
    AddBookView()
}
