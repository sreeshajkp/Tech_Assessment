//
//  SearchModel.swift
//  TestExample
//
//  Created by Veena on 04/04/19.
//  Copyright © 2019 Veena. All rights reserved.
//

import Foundation

struct SearchModel : Codable{
    let status : String?
    let copyright : String?
    let num_results : Int?
    let results : [Results]?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
        case results = "results"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
        results = try values.decodeIfPresent([Results].self, forKey: .results)
    }
}
