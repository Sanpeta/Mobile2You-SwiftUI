//
//  FilmListCellView.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import SwiftUI

struct FilmListCellView: View {
    //MARK: - Properties
    let movie: SimilarMovie?
    @StateObject var genresViewModel = GenreViewModel()
    
    //MARK: - Body
    var body: some View {
        HStack(alignment: .center, spacing: 10) {
            //Image
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movie?.poster_path ?? "")")) { image in
                image.resizable()
            } placeholder: {
                ProgressView()
            }
            .scaledToFit()
            .frame(width:65, height: 95)

            
            VStack(alignment: .leading, spacing: 4) {
                //Title
                Text(movie?.title ?? "")
                    .font(.title3)
                    .fontWeight(.bold)
                
                HStack {
                    let year = movie?.release_date.split(separator: "-")
                    Text(String(year?[0] ?? ""))
                        .font(.subheadline)
                        .padding(.trailing, 5)
                    
                    //Category
                    Text(genresViewModel.genres ?? "")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .lineLimit(2)
                }
            }
            
            Spacer()
            
            //Icon
            Image(systemName: "checkmark.circle.fill")
                .offset(y: -30)
            
        }//: HStack
        .padding(.horizontal, 10)
        .padding(.vertical, 10)
        .onAppear {
            genresViewModel.getGenres(genresIDs: movie?.genre_ids ?? [])
        }
        .frame(maxHeight: 100)
    }
}

//MARK: - Preview
//struct FilmListCellView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilmListCellView()
//            .previewLayout(.sizeThatFits)
//    }
//}
