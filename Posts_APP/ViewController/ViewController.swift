//
//  ViewController.swift
//  Posts_APP
//
//  Created by Donia Elshenawy on 20/07/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }


    @IBAction func fetchDataBtn(_ sender: UIButton) {
        
        APIPosts().fetchData { postArray, error in
            
            if let unwarppedPostArray = postArray{
                //print(unwarppedPostArray)
                for item in 0..<5{
                    print(unwarppedPostArray[item])
                }
                        
            }
            
            if let unwarpedError = error{
                print(unwarpedError)
            }
        }
    }
}

