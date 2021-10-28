//
//  MovieViewModel.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 28/10/21.
//

import SwiftUI

class MovieViewModel: ObservableObject {
    
    @Published var movie: Movie?
    
    func searchMovie() {
        guard let minhaUrl = NSURL(string: "https://api.themoviedb.org/3/movie/157336?api_key=\(API_KEY)") else {
            return
        }
        let request = NSMutableURLRequest(url: minhaUrl as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { [weak self] (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus?.statusCode == 200 {
                
                if data?.count != 0 {
                    
                    do {
                        
                        let movieJSON = try JSONDecoder().decode(Movie.self, from: data!)
                        
                        DispatchQueue.main.async {
                            self?.movie = movieJSON
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
