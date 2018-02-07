//
//  ViewController.swift
//  Instagram
//
//  Created by Nikhil Iyer on 2/2/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit
import Parse

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var postTableView: UITableView!
    
    var posts: [PFObject]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshControlAction(_:)), for: UIControlEvents.valueChanged)
        
        posts = [];
        
        postTableView.delegate = self
        postTableView.dataSource = self
        
        
        queryCall()
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let posts = posts {
            return posts.count
        } else {
            print("FUCK")
            return 0
        }
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("HEY")
        let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell", for: indexPath) as! PostCell
        
        if posts != nil{
            print("WOW")
            let post = posts?[indexPath.row]
            cell.post = post
        }
        
        return cell;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        queryCall()
        
    }
    
    func queryCall(){
        print("LOL")
        let query = PFQuery(className: "Post")
        print(query)
        query.order(byDescending: "createdAt")
        query.includeKey("author")
        query.limit = 20
        
        query.findObjectsInBackground { (posts: [PFObject]?, error: Error?) in
            if let posts = posts {
                // do something with the array of object returned by the call
                self.posts = posts
                self.postTableView.reloadData()
                //print(self.posts)
            } else {
                print(error?.localizedDescription)
            }
        }
        
    }
    
    func refreshControlAction(_ refreshControl: UIRefreshControl) {
        
        // ... Create the URLRequest `myRequest` ...
        let url = URLRequest(url: ("https://warm-stream-96639.herokuapp.com/parse" as? URL)!)
        
        // Configure session so that completion handler is executed on main UI thread
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            
            // ... Use the new data to update the data source ...
            
            // Reload the tableView now that there is new data
            self.postTableView.reloadData()
            
            // Tell the refreshControl to stop spinning
            refreshControl.endRefreshing()
        }
        
        task.resume()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let cell = sender as! PostCell
        let vc = segue.destination as! PostDetailViewController
        let index = postTableView.indexPath(for: cell)
        print("Posts");
//        print()
        
        print(posts?[(index?.row)!]);
        vc.post = posts?[(index?.row)!];
    }
    
    @IBAction func onLogout(_ sender: Any) {
        PFUser.logOut();
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateInitialViewController()
        present(viewController!, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    
}

