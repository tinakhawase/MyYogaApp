//
//  AsanaViewController.swift
//  Yogdarshan
//
//  Created by Deepashri Khawase on 11.04.19.
//  Copyright © 2019 Deep Yoga. All rights reserved.
//

import UIKit

class AsanaViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var asanas = Asana(asanaa: [])
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tell the tableView that this `self` is the datasource and delegate of it
        self.tableview.dataSource = self
        self.tableview.delegate = self
        
        
        DispatchQueue.main.async {
            self.tableview.reloadData()
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return asanas.asanas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellAtCurrentIndex = tableView.dequeueReusableCell(withIdentifier: "AsanaCell", for: indexPath) as! AsanaTableViewCell
        cellAtCurrentIndex.AsanaLabel.text = asanas.asanas[indexPath.row].sanskrit_name
        //    cellAtCurrentIndex.ImageView.image = UIImage( named: String(x.asanas[indexPath.row].image_url!))
        
        //    self.tableview.reloadData()
        return cellAtCurrentIndex
        
        
        //self.tableview.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let mainStoryboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let desVC = mainStoryboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        
        var asana = asanas.asanas[indexPath.row]
        desVC.asanaDetails = asana
        
        self.navigationController?.pushViewController(desVC, animated: true)
    }
    
    
    
}
