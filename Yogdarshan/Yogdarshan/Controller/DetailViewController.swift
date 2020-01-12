//
//  DetailViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 26.12.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit
import AVFoundation

class DetailViewController: UIViewController {
    
    @IBOutlet weak var SanskritName: UILabel!
    @IBOutlet weak var EnglishName: UILabel!
    
    @IBOutlet weak var DetailImage: UIImageView!
    
    @IBOutlet weak var technique: UITextView!
    
    var asanaDetails : Asana.asana?
    var speechSynthesizer = AVSpeechSynthesizer()
    
    //let synth = AVSpeechSynthesizer()
  
    
//    var breathDetails : Asana.breathing_exercises?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let asana = asanaDetails {
            SanskritName.text = asana.sanskrit_name
            EnglishName.text = asana.english_name
            DetailImage.image = UIImage( named: String(asana.image_url!))
            technique.text = asana.technique
        }
        
        
       
    }
    
    func stopAudio (){
        speechSynthesizer.stopSpeaking(at: AVSpeechBoundary.immediate)
    }
    @IBAction func Audio(_ sender: Any) {
        
        
        if (speechSynthesizer.isPaused) {
                   speechSynthesizer.continueSpeaking();
               }
               // The pause functionality
               else if (speechSynthesizer.isSpeaking) {
                   speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)
               }
               // The start functionality
               else if (!speechSynthesizer.isSpeaking) {
        
        if let asana = asanaDetails {
            var speechUtterance: AVSpeechUtterance = AVSpeechUtterance(string:  asana.technique! )
            speechUtterance.rate = AVSpeechUtteranceMaximumSpeechRate / 3.0
            speechUtterance.voice = AVSpeechSynthesisVoice(language: "en-US")
            speechSynthesizer.speak(speechUtterance)
        }
       
        speechSynthesizer.pauseSpeaking(at: AVSpeechBoundary.immediate)


        }
    }
   
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if self.navigationController?.topViewController != self {
            print("Back button tapped")
            stopAudio()
        }
    }

       
}

