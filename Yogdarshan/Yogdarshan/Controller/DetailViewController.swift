//
//  DetailViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 26.12.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var SanskritName: UILabel!
    @IBOutlet weak var EnglishName: UILabel!
    
    @IBOutlet weak var DetailImage: UIImageView!
    
    @IBOutlet weak var technique: UITextView!
    
    var asanaDetails : Asana.asana?
//    var breathDetails : Asana.breathing_exercises?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let asana = asanaDetails {
            SanskritName.text = asana.sanskrit_name
            EnglishName.text = asana.english_name
            DetailImage.image = UIImage( named: String(asana.image_url!))
            technique.text = asana.technique
        }
        
//        if let breath = breathDetails {
//            SanskritName.text = breath.sanskrit_name
//            EnglishName.text = breath.english_name
//            DetailImage.image = UIImage( named: String(breath.image_url!))
//            technique.text = breath.technique
//        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
