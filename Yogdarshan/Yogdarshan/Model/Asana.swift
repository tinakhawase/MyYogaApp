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
//    var breathing : [breathing_exercises]
//    var warmup : [Warmup_ex]
//    var suryanamaskar : [Surya_Namaskar]
//    var relaxation : [relaxation_ex]
//    var meditation : [meditation]
    var breathing : [asana]
    var warmup : [asana]
    var suryanamaskar : [asana]
    var relaxation : [asana]
    var meditation : [asana]
    
    
//    init(asanaa:[asana] , breath : [breathing_exercises], warmups : [Warmup_ex],suryanam : [Surya_Namaskar],relax : [relaxation_ex], meditate : [meditation] ) {
//        self.asanas = asanaa
//        self.breathing = breath
//        self.warmup = warmups
//        self.suryanamaskar = suryanam
//        self.relaxation = relax
//        self.meditation = meditate
//
//    }
    
    init(asanaa:[asana] , breath : [asana], warmups : [asana],suryanam : [asana],relax : [asana], meditate : [asana] ) {
           self.asanas = asanaa
           self.breathing = breath
           self.warmup = warmups
           self.suryanamaskar = suryanam
           self.relaxation = relax
           self.meditation = meditate
         
       }
    
    enum CodingKeys: String, CodingKey {
        case asanas = "asanas"
        case breathing = "breathing_exercises"
        case warmup = "warmup"
        case suryanamaskar = "suryanamaskar"
        case relaxation = "relaxation"
        case meditation = "meditation"
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
        var limitations : String?
    }
    

    

    }


