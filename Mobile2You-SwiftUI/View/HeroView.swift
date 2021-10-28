//
//  HeroView.swift
//  Mobile2You-SwiftUI
//
//  Created by Sidnei de Souza Junior on 27/10/21.
//

import SwiftUI

struct HeroView: View {
    //MARK: - Properties
    @StateObject var movieViewModel = MovieViewModel()
    
    
    //MARK: - Body
    var body: some View {
        Group {
            VStack(alignment: .trailing, spacing: 10) {
                //Image
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/original\(movieViewModel.movie?.backdrop_path ?? "")")) { image in
                    image.resizable()
                } placeholder: {
                    ProgressView()
                }
                .scaledToFill()
                .frame(minHeight: UIScreen.main.bounds.size.height * 0.45)
                
                
                HStack(alignment: .center, spacing: 0) {
                    Text(movieViewModel.movie?.title ?? "")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.leading)
                        .lineLimit(2)
                    
                    Spacer()
                    
                    Image(systemName: "suit.heart.fill")
                        .foregroundColor(.white)
                        .onTapGesture {
                            print("coracao")
                        }
                }//: HStack
                .padding(.horizontal, 10)
                
                HStack(alignment: .bottom , spacing: 0) {
                    HStack {
                        Image(systemName: "suit.heart.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                print("coracao")
                            }
                        
                        Text("\(movieViewModel.movie?.vote_count ?? 0) Likes")
                            .font(Font.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 5)
                    
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundColor(.white)
                            .onTapGesture {
                                print("coracao")
                            }
                        
                        Text("​\(movieViewModel.movie?.popularity ?? 0) views")
                            .font(Font.subheadline)
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }//: HStack
                .padding(.horizontal, 10)
            }//: VStack
            .background(Color("SemiBlack"))
        }//: Group
        .padding(.bottom, 10)
        .onAppear {
            movieViewModel.searchMovie()
        }
    }
}

//MARK: - Preview
//struct HeroView_Previews: PreviewProvider {
//    static var previews: some View {
//        HeroView()
//            .previewLayout(.sizeThatFits)
//    }
//}
