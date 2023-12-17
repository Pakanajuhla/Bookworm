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
    @Query var books: [Book]
    
    @State private var showingAppScreen = false
    
    var body: some View {
        NavigationStack {
            Text("Count: \(books.count)")
                .navigationTitle("Bookworm")
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
