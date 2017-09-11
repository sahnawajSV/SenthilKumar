//
//  MovieListViewController.swift
//  MyMoviee
//
//  Created by APPLE on 07/09/17.
//  Copyright © 2017 APPLE. All rights reserved.
//

import UIKit

class MovieListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet var movieTableView: UITableView!
    
    var titleArr:Array<Any> = []
    var descriptionArr :Array<Any> = []
    var posterPathArr :Array<Any> = []
    var voteCountArr :Array<Any> = []
    var releaseDateArr :Array<Any> = []

    let imageBaseURL : String = "https://image.tmdb.org/t/p/w500"

    
    
    //var myModel = movieModel(movieTitle: <#String#>, movieDescription: <#String#>, posterPath: <#String#>, voteCount: <#String#>, releaseDate: <#String#>)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.isNavigationBarHidden = true
        
        
        getMovieList()
            

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArr.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        cell.movieTitle.text = self.titleArr[indexPath.row] as? String
        cell.movieDescription.text = self.descriptionArr[indexPath.row] as! String
        
        let fullUrl = "\(imageBaseURL)\(self.posterPathArr[indexPath.row])"
        cell.movieThumbnail.setImageFromURl(stringImageUrl: fullUrl)
        
        
        
        return cell
    }


    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "MovieDetailViewController") as! MovieDetailViewController
        
        nextViewController.imageString = "\(imageBaseURL)\(self.posterPathArr[indexPath.row])"
        nextViewController.titleStr = self.titleArr[indexPath.row] as? String
        nextViewController.descriptionStr = self.descriptionArr[indexPath.row] as? String
        nextViewController.voteCountStr = self.voteCountArr[indexPath.row] as? String
        self.navigationController?.pushViewController(nextViewController, animated: true)
        
    }
    
  
    // Remove Occurance
    func removeOccurance(inputString:String) -> String {
        
        let outputStr = inputString.replacingOccurrences(of: "\'", with: "", options:
            NSString.CompareOptions.literal, range: nil)
        return outputStr
        
    }
    
    
    func getMovieList() {
        
        let loginURL: URL = URL(string:"https://api.themoviedb.org/3/discover/movie?api_key=626d05abf324b3be1c089c695497d49c")! // Passing URL
        let urlRequest: NSMutableURLRequest = NSMutableURLRequest(url: loginURL)
        urlRequest.httpMethod = "GET"
        urlRequest.addValue("application/json;charset=utf-8", forHTTPHeaderField: "Content-Type")
        
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: urlRequest as URLRequest) { data, response, error in
            
            if (error != nil) {
                
                print(error!)
                
            }else {
                DispatchQueue.main.async {
                    
                    if (data != nil) {
                     
                        self.getResponde(data!)
                        
                    }else{
                        
                        //Error
                        print("Error")
                        
                    }
                }
            }
        }
        
        task.resume()
        
        
    }
    
    
    
    func getResponde(_ response: Data!){
        
        do{
            let jsonString =  try JSONSerialization.jsonObject(with: response!, options:.allowFragments) as? [String:Any]
            print(jsonString!)
            
            
            if let hashTags = jsonString?["results"] as? [[String:Any]] {
                for tag in hashTags {
                 titleArr.append(tag["title"]!)
                 descriptionArr.append(tag["overview"]!)
                    
                 let validStr = tag["poster_path"]! as! String
                 posterPathArr.append(removeOccurance(inputString: validStr))
                 voteCountArr.append(tag["vote_count"]!)
                 releaseDateArr.append(tag["release_date"]!)
                    
                }
            }
    
            
            print(posterPathArr)
            
            
            DispatchQueue.main.async {
                
            self.movieTableView.reloadData()

            }
            

        }catch {
            //Error
            print("Error")
            
        }

        
        
        
    }
    
}

extension UIImageView{
    
    func setImageFromURl(stringImageUrl url: String){
        
        if let url = NSURL(string: url) {
            if let data = NSData(contentsOf: url as URL) {
                self.image = UIImage(data: data as Data)
            }
        }
    }
}
