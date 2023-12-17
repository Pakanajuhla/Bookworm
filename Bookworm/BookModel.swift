//
//  BookModel.swift
//  Bookworm
//
//  Created by Владислав on 17.12.2023.
//

import Foundation
import SwiftData

@Model
class Book {
    let titel: String
    let author: String
    let genre: String
    let review: String
    let rating: Int
    
    init(titel: String, author: String, genre: String, review: String, rating: Int) {
        self.titel = titel
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
