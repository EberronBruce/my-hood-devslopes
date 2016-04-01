//
//  ViewController.swift
//  my-hood-devslopes
//
//  Created by Bruce Burgess on 4/1/16.
//  Copyright © 2016 Red Raven Computing Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var posts = [Post]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        //tableView.estimatedRowHeight = 87
        
        let post = Post(imagePath: "", title: "Post 1", description: "post 1 description")
        let post2 = Post(imagePath: "", title: "Post 2", description: "this is a second post of no significance")
        let post3 = Post(imagePath: "", title: "Post 3", description: "this is 3rd and most important description")
        
        posts.append(post)
        posts.append(post2)
        posts.append(post3)
        
        tableView.reloadData()
        
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let post = posts[indexPath.row]
        if let cell = tableView.dequeueReusableCellWithIdentifier("PostCell") as? PostCell {
            cell.configureCell(post)
            return cell
        } else {
            let cell = PostCell()
            cell.configureCell(post)
            return cell
        }
        
        
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 87.0
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    


}

