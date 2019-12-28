//
//  FirstViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 11.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController , UICollectionViewDelegate, UICollectionViewDataSource {
    
    private var asana : Asana
    //private var breath : Asana
    //
    required init?(coder aDecoder: NSCoder) {
        self.asana = Asana(asanaa: [], breath: [], warmups: [], suryanam: [], relax: [], meditate: [])
        super.init(coder: aDecoder)
    }
    
    let items =  ["1", "2", "3", "4", "5", "6"]
    let imageArray = [UIImage(named: "breathingg"),
                      UIImage(named: "warmup"),
                      UIImage(named: "suryanamaskara"),
                      UIImage(named: "yogasanas"),
                      UIImage(named: "meditation"),
                      UIImage(named: "relaxation")]
    
    let nameArray = ["Breathing","Warm up","Surya Namaskara","Asanas","Meditation","Relaxation"]
    
    //let imageArray = [UIImage(named: "yogasanas")]
    
    //let nameArray = ["Asanas"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        guard let mainUrl = Bundle.main.url(forResource: "YogaAppAsana", withExtension: "json") else { return }
        
        decodeData(pathName: mainUrl)
        
    }
    
    
    //func numberOfSections(in collectionView: UICollectionView) -> Int {
    //return 1
    //}
    
    func collectionView( _ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return imageArray.count
    }
    
    func collectionView( _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        
        cell.image.image =   imageArray[indexPath.row]
        cell.label.text! = nameArray[indexPath.row]
        return cell
    }
    
    func collectionView( _ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.item)
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "AsanaViewController") as! AsanaViewController
        
        switch indexPath.row {
        case 0:
            desVC.onlyAsanas = asana.breathing
        case 1:
            desVC.onlyAsanas = asana.warmup
        case 2:
            desVC.onlyAsanas = asana.suryanamaskar
        case 3:
            desVC.onlyAsanas = asana.asanas
        case 4:
            desVC.onlyAsanas = asana.meditation
        default:
            desVC.onlyAsanas = asana.relaxation
        }
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    func decodeData(pathName: URL){
        do{
            let jsonData = try Data(contentsOf: pathName)
            let decoder = JSONDecoder()
            asana = try decoder.decode(Asana.self, from: jsonData)
        
        } catch {
            print(error)
        }
    }
    
}

