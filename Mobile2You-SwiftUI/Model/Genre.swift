//
//  Genre.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import Foundation

struct Genres: Hashable, Codable {
    let genres: [Genre]
}


struct Genre: Hashable, Codable {
    let id: Int
    let name: String
}
