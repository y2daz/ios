//
//  ViewController.swift
//  UITableView
//
//  Created by IMM on 06/07/2016.
//  Copyright © 2016 sliit. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    var animalNames: [String] = ["Cat","Dog","Elephant","Gangaroo","Hipopotamos","Lion","Zebra"];
    
    var animalImages: [String] = ["Cat","Dog","Elephant","Gangaroo","Hipopotamos","Lion","Zebra"];    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return animalNames.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell:UITableViewCell=UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "mycell")
        cell.textLabel!.text = animalNames[indexPath.row]
        var image : UIImage = UIImage(named: animalImages[indexPath.row])!
        cell.imageView!.image = image
        return cell
    }
    
    @IBOutlet weak var simpleTableView: UITableView!
}

