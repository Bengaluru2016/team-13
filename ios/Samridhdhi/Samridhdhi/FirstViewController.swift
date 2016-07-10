//
//  FirstViewController.swift
//  Samridhdhi
//
//  Created by Randhir Singh on 09/07/16.
//  Copyright © 2016 Randhir Singh. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var students = [[String:AnyObject]]()
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        students.append(["name":"Pari", "age": 1,"progress":85])
        students.append(["name":"Abhinav", "age": 2, "progress":65])
        students.append(["name":"Kartik", "age": 3, "progress":74])
        students.append(["name":"Meethi", "age": 4, "progress":61])
        students.append(["name":"Anushka", "age": 5, "progress":88])
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return students.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("studentListCell")
        cell?.textLabel?.text = students[indexPath.row]["name"] as? String
        if let progress = students[indexPath.row]["progress"] as? Int {
            cell?.detailTextLabel?.text = "Progress: " + progress.description
        }
//        cell?.imageView.scal
        if let num = students[indexPath.row]["age"] as? Int {
            switch num {
            case 1:
                cell?.imageView?.image = UIImage(named: "kidoblivion")
                break
            case 2:
                cell?.imageView?.image = UIImage(named: "abhinav")
                break
            case 3:
                cell?.imageView?.image = UIImage(named: "kartik")
                break
            case 4:
                cell?.imageView?.image = UIImage(named: "meethi")
                break
            case 5:
                cell?.imageView?.image = UIImage(named: "anushka")
                break
            default: break
                
            }
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 70
    }


}

