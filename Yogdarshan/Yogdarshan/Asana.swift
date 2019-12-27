//
//  jsonViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 12.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import Foundation



class Asana : Codable {
    var asanas: [asana]
    
    
    
    init(asanaa:[asana]) {
        self.asanas = asanaa
        
        
//        self.sanskrit_name = _dictionary["sanskrit_name"] as? String ?? "NA"
//        self.english_name = _dictionary["english_name"] as? String ?? "NA"
//        self.description = _dictionary["description"] as? String ?? "NA"
//        self.technique = _dictionary["technique"] as? String ??  "NA"
//        self.precaution = _dictionary["precaution"] as? String ?? "NA"
//        self.image_url = _dictionary["image_url"] as? String ?? "NA"
//        self.category = _dictionary["category"] as? String ?? "NA"
//        self.benefits = _dictionary["benefits"] as? String ?? "NA"
        
        
        
    }
    
    enum CodingKeys: String, CodingKey {
        case asanas = "asanas"
    }
    
    
    struct asana: Codable {
        var sanskrit_name: String?
        var english_name: String?
        var description: String?
        var technique: String?
        var precaution: String?
        var image_url: String?
        var category: String?
        var benefits: String?
    }

    }


