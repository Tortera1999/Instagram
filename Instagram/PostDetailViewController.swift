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

class PostDetailViewController: UIViewController {

    @IBOutlet weak var usernamePostDetail: UILabel!
    
    @IBOutlet weak var datePostDetail: UILabel!
    
    @IBOutlet weak var captionPostDetail: UILabel!
    
    var post: PFObject! {
        didSet {
             print(post)
            self.usernamePostDetail.text = post["author"] as? String
            self.captionPostDetail.text = post["caption"] as? String
            self.datePostDetail.text = "\(post.createdAt!)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

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
