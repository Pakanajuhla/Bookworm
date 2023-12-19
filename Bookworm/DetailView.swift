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
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(titel: "Test book", author: "Text author", genre: "Thriller", review: "", rating: 3)
        
       return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Faild to create preview: \(error.localizedDescription)")
    }
}
