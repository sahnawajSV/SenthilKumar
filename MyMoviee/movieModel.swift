//
//  movieModel.swift
//  MyMoviee
//
//  Created by APPLE on 07/09/17.
//  Copyright © 2017 APPLE. All rights reserved.
//

import UIKit

class movieModel{
    
    var movieTitle:String?
    var movieDescription:String?
    var posterPath:String?
    var voteCount:String?
    var releaseDate:String?
    
    init(movieTitle:String,movieDescription:String,posterPath:String,voteCount:String,releaseDate:String) {

        self.movieTitle = movieTitle
        self.movieDescription = movieDescription
        self.posterPath = posterPath
        self.voteCount = voteCount
        self.releaseDate = releaseDate
        
    }

}


