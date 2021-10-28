//
//  SimilarMovieViewModel.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 28/10/21.
//

import Foundation

class SimilarMovieViewModel: ObservableObject {
    
    @Published var similarMovie: [SimilarMovie]? = []
    
    func searchSimilarMovieList() {
        guard let minhaUrl = NSURL(string: "https://api.themoviedb.org/3/movie/157336/similar?api_key=\(API_KEY)") else {
            return
        }
        let request = NSMutableURLRequest(url: minhaUrl as URL)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            let httpStatus = response as? HTTPURLResponse
            
            if httpStatus?.statusCode == 200 {
                
                if data?.count != 0 {
                    
                    do {
                                             
                        let similarMovieListJSON = try JSONDecoder().decode(Similar.self, from: data!)
                        
                        
                        DispatchQueue.main.async {
                            
                            self.similarMovie = similarMovieListJSON.results
                            
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
