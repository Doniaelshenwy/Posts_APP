//
//  ViewController.swift
//  Posts_APP
//
//  Created by Donia Elshenawy on 20/07/2022.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var userIdLabel: UILabel!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    var arrayPost : [Posts] = []
    
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.activityIndicator.startAnimating()
        APIPosts().fetchData { postArray, error in
            DispatchQueue.main.async{
                self.activityIndicator.stopAnimating()
            }
          
            if let unwarppedArray = postArray{
                self.arrayPost = unwarppedArray
                
                print(self.arrayPost.count)
                
                DispatchQueue.main.async {
                    self.userIdLabel.text = String(self.arrayPost[0].id)
                    self.titleLabel.text = self.arrayPost[0].title
                    self.bodyLabel.text = self.arrayPost[0].body
                }
            }
            
            if let unwarppedError = error{
                print(unwarppedError)
            }
        }
      
    }

//
//    @IBAction func fetchDataBtn(_ sender: UIButton) {
//
//        APIPosts().fetchData { postArray, error in
//
//            if let unwarppedPostArray = postArray{
//                //print(unwarppedPostArray)
//                for item in 0..<5{
//                 //   print(unwarppedPostArray[item])
//                    DispatchQueue.main.async { [self] in
//                        userIdLabel.text = String(unwarppedPostArray[item].id)
//                        titleLabel.text = unwarppedPostArray[item].title
//                        bodyLabel.text = unwarppedPostArray[item].body
//                    }
//
//                }
//
//            }
//
//            if let unwarpedError = error{
//                print(unwarpedError)
//            }
//        }
//    }
//
    
    @IBAction func nextBtn(_ sender: UIButton) {
        
        index = index + 1
        
        if index == 100{
            index = 0
        }
        
        self.userIdLabel.text = String(self.arrayPost[index].id)
        self.titleLabel.text = self.arrayPost[index].title
        self.bodyLabel.text = self.arrayPost[index].body
    
        
    }
    
    
    
    @IBAction func previousBtn(_ sender: UIButton) {
        
        if index > 1{
            index = index - 1
        }
        else{
            index = arrayPost.count - index
        }
        self.userIdLabel.text = String(self.arrayPost[index].id)
        self.titleLabel.text = self.arrayPost[index].title
        self.bodyLabel.text = self.arrayPost[index].body
        
    }
    
    
    
    
}

