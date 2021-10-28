//
//  ContentView.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import SwiftUI

struct ContentView: View {
    //MARK: - Properties
    @StateObject var similarMovie = SimilarMovieViewModel()
    
    //MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            Group() {
                //MARK: - HeroView
                HeroView()
                
                //MARK: - List View
                VStack {
                    ForEach(similarMovie.similarMovie ?? [], id: \.self) { movie in
                        FilmListCellView(movie: movie)
                    }//: ForEach
                }//: VStack
            }// : Group
        }//: ScrollView
        .ignoresSafeArea(.container, edges: .top)
        .onAppear {
            similarMovie.searchSimilarMovieList()
        }
    }
}

//MARK: - Preview
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContenwtView()
//    }
//}
