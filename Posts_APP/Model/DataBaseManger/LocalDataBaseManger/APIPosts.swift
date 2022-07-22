//
//  APIPosts.swift
//  Posts_APP
//
//  Created by Donia Elshenawy on 20/07/2022.
//

import Foundation

class APIPosts{
    var postArray : [Posts] = []
    var postAlamofireArray : [Posts] = []
    
    func fetchData(Compilation : @escaping([Posts]?,String?)-> (Void)) {
        
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts"){
        
            var request = URLRequest(url: url)
        
            request.httpMethod = "GET"
            
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                
                if let unwarppedData = data{
                   // print(unwarppedData)
                 let jsonDecoder = JSONDecoder()
                    if let decodedData = try?jsonDecoder.decode([Posts].self, from: unwarppedData){
                    self.postArray = decodedData
                   
                        Compilation(self.postArray, nil)
                       
                    }
                }
                
                if let unwarppedError = error{
                   let stringError = unwarppedError.localizedDescription
                    Compilation(nil, stringError)
               
                }
            }
            
            task.resume()
           
        }
       
       
    }
    
    
    
    
}
