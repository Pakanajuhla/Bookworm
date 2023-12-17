//
//  Student.swift
//  Bookworm
//
//  Created by Владислав on 16.12.2023.
//

import Foundation
import SwiftData

@Model
class Student {
    let id: UUID
    let name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
}
