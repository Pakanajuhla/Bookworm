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
    let title: String
    let author: String
    let genre: String
    let review: String
    let rating: Int
    let date: Date
    
    init(title: String, author: String, genre: String, review: String, rating: Int, date: Date) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
        self.date = date
    }
}
