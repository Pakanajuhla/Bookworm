//
//  DetailView.swift
//  Bookworm
//
//  Created by Владислав on 19.12.2023.
//

import SwiftUI
import SwiftData

struct DetailView: View {
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre)
                    .resizable()
                    .scaledToFill()
                
                Text(book.genre.uppercased())
                    .fontWeight(.black)
                    .padding(10)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author)
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
            
        }
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize) // отскок прокрутки
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Text title", author: "Text author", genre: "Thriller", review: "This was a great book", rating: 4)
       return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Faild to create preview: \(error.localizedDescription)")
    }
}
