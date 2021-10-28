//
//  SimilarMovie.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import Foundation

struct Similar: Hashable, Codable {
    let page: Int
    let results: [SimilarMovie]
}

struct SimilarMovie: Hashable, Codable {
    let title: String
    let poster_path: String?
    let release_date: String
    let genre_ids: [Int]
}
