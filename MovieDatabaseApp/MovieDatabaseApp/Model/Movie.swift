//
//  Movie.swift
//  MovieDatabaseApp
//
//  Created by Austin West on 5/17/19.
//  Copyright © 2019 Austin West. All rights reserved.
//

import UIKit

struct Movie: Decodable {
    
    let title: String
    let vote_average: Double
    let overview: String
    let image: URL
}


