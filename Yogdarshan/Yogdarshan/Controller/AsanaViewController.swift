//
//  AsanaViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 11.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class AsanaViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var asanas = Asana(asanaa: [], breath: [], warmups: [], suryanam: [], relax: [], meditate: [])
    var onlyAsanas : [Asana.asana]?
    
   @IBOutlet weak var tableview: UITableView!
   
    //@IBOutlet weak var title: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tell the tableView that this `self` is the datasource and delegate of it
        
        self.tableview.dataSource = self
        self.tableview.delegate = self
        self.tableview.separatorStyle = .none
        
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //        return asanas.asanas.count
        if let asanas = onlyAsanas {
            return asanas.count
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAtCurrentIndex = tableView.dequeueReusableCell(withIdentifier: "AsanaCell", for: indexPath) as! AsanaTableViewCell
        
        
        if let asanas = onlyAsanas {
            if let sanskritName = asanas[indexPath.row].sanskrit_name{
                cellAtCurrentIndex.textLabel!.text =  asanas[indexPath.row].sanskrit_name
            } else{
                cellAtCurrentIndex.textLabel!.text =  asanas[indexPath.row].english_name
            }
            
        }
        
        
        return cellAtCurrentIndex
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        //var asana = asanas.breathing[indexPath.row]
        if let asanas = onlyAsanas {
            desVC.asanaDetails = asanas[indexPath.row]
            self.navigationController?.pushViewController(desVC, animated: true)
        }
//        var asana = asanas.asanas[indexPath.row]
        
    }
    
    
    
}
