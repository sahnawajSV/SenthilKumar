//
//  MovieDetailViewController.swift
//  MyMoviee
//
//  Created by APPLE on 07/09/17.
//  Copyright © 2017 APPLE. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {
    
    
    @IBOutlet var detailImageView: UIImageView!
    @IBOutlet var detailTitleLabel: UILabel!
    @IBOutlet var detailDescriptionView: UITextView!
    @IBOutlet var voteCountLabel: UILabel!
    @IBOutlet var releaseDateLabel: UILabel!
    
    var imageString : String = ""
    var titleStr: String? = ""
    var descriptionStr: String? = ""
    var voteCountStr: String? = ""
    
    
    @IBAction func backAction(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        detailTitleLabel.text = titleStr
        detailDescriptionView.text = descriptionStr
        voteCountLabel.text = "Vote Count=\(voteCountStr)"
        
        
        detailImageView.setImageFromURl(stringImageUrl: imageString)
        
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
