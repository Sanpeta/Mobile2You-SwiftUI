//
//  Movie.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import SwiftUI

struct Movie: Codable {
    let title: String
    let vote_count: Int
    let popularity: Double
    let backdrop_path: String
}
