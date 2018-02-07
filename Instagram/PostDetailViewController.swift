//
//  PostDetailViewController.swift
//  Instagram
//
//  Created by Nikhil Iyer on 2/3/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit
import Parse
import ParseUI
import Foundation

class PostDetailViewController: UIViewController {

    @IBOutlet weak var usernamePostDetail: UILabel!
    
    @IBOutlet weak var datePostDetail: UILabel!
    
    @IBOutlet weak var captionPostDetail: UILabel!
    
    var user: PFUser?;
    var caption: String?
    var createdAt: String?
    
    
    var post: PFObject! {
        didSet {
            
            user = post["author"] as? PFUser
            //print(user?.username)
            caption = post["caption"] as? String
            createdAt = "\(post.createdAt!)"
//            print(createdAt)
//            let dateFormatter = DateFormatter();
//            dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss +x"
//            let date = dateFormatter.date(from: createdAt!)
//            
//            
//            dateFormatter.dateFormat = "yyyy-MM-dd"///this is what you want to convert format
//            let timeStamp = dateFormatter.string(from: date!)
//        
//            print(timeStamp)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.usernamePostDetail.text = "\(String(describing: (user?.username)!))"
        self.captionPostDetail.text = "\(String(describing: caption!))"
        self.datePostDetail.text = "\(String(describing: createdAt!)))"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
