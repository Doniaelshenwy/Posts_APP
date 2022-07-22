//
//  ExtensionAPIPosts.swift
//  Posts_APP
//
//  Created by Donia Elshenawy on 21/07/2022.
//

import Foundation
import Alamofire

extension APIPosts{
   
    
    
    func fetchDataAlamofire(compilation: @escaping([Posts]?, String?)->(Void)){
        if let url = URL(string: "https://jsonplaceholder.typicode.com/posts"){
            
            let request = AF.request(url,method: .get,encoding: JSONEncoding.default)
            request.responseJSON { respone in
                
                if let data = respone.data{
                  let jsonDecoder = JSONDecoder()
                    if let decodedData = try?jsonDecoder.decode([Posts].self, from: data){
                        self.postAlamofireArray = decodedData
                        compilation(self.postAlamofireArray, nil)
                    }
                        
                }
                
                if let error = respone.error{
                    let stringError = error.localizedDescription
                    self.postAlamofireArray = []
                    compilation(nil,stringError)
                }
                
                
                
            }
            
        }
        
        
    }
    
}
