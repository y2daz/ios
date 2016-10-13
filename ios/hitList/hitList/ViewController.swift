//
//  ViewController.swift
//  hitList
//
//  Created by IMM on 7/20/16.
//  Copyright © 2016 IMM. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var names = [String]()
    var people = [NSManagedObject]()
    
    @IBAction func addName(sender: AnyObject) {
        var alert = UIAlertController(title: "New Name", message: "Add a New Name", preferredStyle: .Alert)
        
//        let saveAction = UIAlertAction(title: "Save", style: .Default){
//            (action: UIAlertAction!) -> Void in
//            
//            let textField = alert.textFields![0] as UITextField
//            self.names.append(textField.text!)
//            self.tableView.reloadData()
//        }
        let saveAction = UIAlertAction(title: "Save", style: .Default) { (action: UIAlertAction!) -> Void in
            
                let textField = alert.textFields![0] as UITextField
                self.saveName(textField.text!)
                self.tableView.reloadData()
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default){
            (action: UIAlertAction!) -> Void in
        }
        
        alert.addTextFieldWithConfigurationHandler{
            (textField: UITextField!) -> Void in
        }
        
        alert.addAction(saveAction)
        alert.addAction(cancelAction)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func saveName(name: String) {
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let entity = NSEntityDescription.entityForName("Person",
            inManagedObjectContext:
            managedContext)
        
        let person = NSManagedObject(entity: entity!,
            insertIntoManagedObjectContext:managedContext)
        
        //3
        person.setValue(name, forKey: "name")
        
        //4
//        var error: NSError?
//        if !managedContext.save(&error) {
//            print("Could not save \(error), \(error?.userInfo)")
//        }
        //5
        people.append(person)
    }
    
//    func saveName(name: String){
//        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//        
//        let managedContext = appDelegate.managedObjectContext
//        
//        let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: managedContext)
//        
//        let person = NSManagedObject(entity: entity!, insertIntoManagedObjectContext: managedContext)
//        
//        person.setValue(name, forKey: "name")
//        
////        var error: NSError?
////        if !managedContext.save(&error){
////            print("Could not save! \(error), \(error?.userInfo)")
////        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\"The List\""
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest(entityName:"Person")
        
        //3
//        var error: NSError?
        
        var fetchedResults : [NSManagedObject]?

        do {
            //fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
            fetchedResults = try managedContext.executeFetchRequest(fetchRequest) as? [NSManagedObject]
        } catch let error as NSError {
            print("Error \(error.localizedDescription)")
        }
        
        if let results = fetchedResults {
            people = results
        } else {
            print("Could not fetch")
        }
    }
    
    
    func tableView(tableView: UITableView,
        numberOfRowsInSection section: Int) -> Int {
            return people.count
    }
    
    func tableView(tableView: UITableView,
        cellForRowAtIndexPath
        indexPath: NSIndexPath) -> UITableViewCell {
            
            let cell =
            tableView.dequeueReusableCellWithIdentifier("Cell")!
                as UITableViewCell
            
            let person = people[indexPath.row]
            cell.textLabel!.text = person.valueForKey("name") as! String?
            
            return cell
    }
//    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
//            return names.count
//    }
//
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
//        let cell =
//        tableView.dequeueReusableCellWithIdentifier("Cell")!
//            as UITableViewCell
//        
//        cell.textLabel!.text = names[indexPath.row]
//        
//        return cell
//    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

