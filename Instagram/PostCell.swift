//
//  PostCell.swift
//  Instagram
//
//  Created by Nikhil Iyer on 2/3/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class PostCell: UITableViewCell {

    
    @IBOutlet weak var postImageView: PFImageView!
    
    @IBOutlet weak var postCaptionLabel: UILabel!
    
    var post: PFObject! {
        didSet {
            self.postImageView.file = post["media"] as? PFFile
            self.postCaptionLabel.text = post["caption"] as? String
            self.postImageView.loadInBackground()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
