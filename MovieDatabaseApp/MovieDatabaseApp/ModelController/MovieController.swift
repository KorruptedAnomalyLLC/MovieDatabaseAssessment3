//
//  MovieController.swift
//  MovieDatabaseApp
//
//  Created by Austin West on 5/17/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import Foundation

class MovieController {
    
    //    singleton
    static let sharedInstance = MovieController ()
    
    //    CRUD
    //    Search by ID or Character's name
    func fetchMovie(searchTerm: String, completion: @escaping (Movie?) ->Void) {
        
        //        build the URL
        guard let baseURL = URL(string: "https://api.themoviedb.org/3/movie/") else { return }
        //        Add componenets and query items
        let movieComnponenetURL = baseURL.appendingPathComponent("")
        let finalURL = movieComnponenetURL.appendingPathComponent(searchTerm)
        
        print(finalURL)
        
        URLSession.shared.dataTask(with: finalURL) { (data, _, error) in
            //            check for error
            if let error = error {
                print("There was an explosion at ther server office while you tried to retrieve \(searchTerm): \(error)")
                return
            }
            
            //            check for data
            if let data = data {
                //                decode data
                do {
                    let movie = try JSONDecoder().decode(Movie.self, from: data)
                    completion(movie)
                } catch {
                    print("Your movie no longer exists. Did it ever?")
                    completion(nil);return
                }
            }
        }.resume()
    }
    
//    image retrieval goes here
    
}
