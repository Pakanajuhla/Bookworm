//
//  ContentView.swift
//  Bookworm
//
//  Created by Владислав on 15.12.2023.
//

import SwiftUI
import SwiftData


struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [
        SortDescriptor(\Book.title),
        SortDescriptor(\Book.author)
    ]) var books: [Book]
    
    @State private var showingAppScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink(value: book) {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title)
                                    .font(.headline)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self) { book in
                DetailView(book: book)
            }
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add Book", systemImage: "plus") {
                        showingAppScreen.toggle()
                    }
                }
            }
            .sheet(isPresented: $showingAppScreen) {
                AddBookView()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
