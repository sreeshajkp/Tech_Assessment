//
//  APIManager.swift
//  TestExample
//
//  Created by Veena on 04/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import Alamofire

class APIManager {
 
    func fetchSearchResults(completion : @escaping (_ searchResult : [Results]) -> ()){
        let requeststring = String(format: "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?api-key=2QNT75wrN75APoNtAkyGOZoxwQB6uAYd")

        Alamofire.request(requeststring).responseJSON { response in
            print("Request:\(String(describing: response.request))")
            do {
                print(response.data)
                let model = try JSONDecoder().decode(SearchModel.self, from: response.data ?? Data())
                if let resultsValue = model.results{
                     completion(resultsValue)
                }
            } catch let error {
               // completion(nil)
            }
    }
    }
}



