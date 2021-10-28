//
//  GenreViewModel.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 28/10/21.
//

import Foundation
import SwiftUI

class GenreViewModel: ObservableObject {
    
    @Published var genres: String?
    
    func getGenres(genresIDs: [Int]) {
        guard let minhaUrl = NSURL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=\(API_KEY)") else {
            return
        }
        let request = NSMutableURLRequest(url: minhaUrl as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus?.statusCode == 200 {
                
                if data?.count != 0 {
                    
                    do {
                     
                        let genreListJSON = try JSONDecoder().decode(Genres.self, from: data!)
                        
                        DispatchQueue.main.async {
                            
                            var genreString = ""
                            for (index, genreMovie) in genresIDs.enumerated() {
                                for genre in genreListJSON.genres {
                                    if genre.id == genreMovie {
                                        if index != genresIDs.count-1 {
                                            genreString += "\(genre.name), "
                                        } else {
                                            genreString += "\(genre.name)"
                                        }
                                    }
                                }
                            }
                            
                            self.genres = genreString
                            
                        }
                        
                        
                    } catch let error {
                        
                        print("Error to decode \(error)")
                        
                    }
                    
                }
                
            }
            
        }
        task.resume()
    }
    
}
