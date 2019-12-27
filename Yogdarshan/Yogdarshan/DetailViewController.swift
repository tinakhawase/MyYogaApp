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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let asana = asanaDetails {
            SanskritName.text = asana.sanskrit_name
            EnglishName.text = asana.english_name
            DetailImage.image = UIImage( named: String(asana.image_url!))
            technique.text = asana.technique
        }
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
