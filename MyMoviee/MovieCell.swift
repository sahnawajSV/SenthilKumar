//
//  MovieCell.swift
//  MyMoviee
//
//  Created by APPLE on 07/09/17.
//  Copyright © 2017 APPLE. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieDescription: UITextView!
    @IBOutlet var movieThumbnail: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
