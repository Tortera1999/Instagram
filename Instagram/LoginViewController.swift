//
//  LoginViewController.swift
//  Instagram
//
//  Created by Nikhil Iyer on 2/2/18.
//  Copyright © 2018 Nikhil Iyer. All rights reserved.
//

import UIKit
import Parse

class LoginViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var instagramLabel: UILabel!
    
    let alertControllerInvalidUsername = UIAlertController(title: "Invalid username or password", message: "", preferredStyle: .alert)
    let alertControllerAccountExists = UIAlertController(title: "Account already exists for this username", message: "", preferredStyle: .alert)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let OKAction = UIAlertAction(title: "OK", style: .default) {
            (action) in
        }
        alertControllerInvalidUsername.addAction(OKAction)
        alertControllerAccountExists.addAction(OKAction)
        
        instagramLabel.font = UIFont.boldSystemFont(ofSize: 40)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onSignIn(_ sender: Any) {
        
        PFUser.logInWithUsername(inBackground: usernameField.text!, password: passwordField.text!) { (user: PFUser?, error: Error?) in
            if let error = error {
                self.present(self.alertControllerInvalidUsername, animated: true)
                print("User log in failed: \(error.localizedDescription)")
            } else {
                print("User logged in successfully")
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil);
                
                // display view controller that needs to shown after successful login
            }
        }
        
    }
    
    @IBAction func onSignUp(_ sender: Any) {
        
        let newUser = PFUser();
        
        newUser.username = usernameField.text
        newUser.password = passwordField.text
        
        newUser.signUpInBackground { (success: Bool, error: Error?) in
            if let error = error {
                self.present(self.alertControllerAccountExists, animated: true)
                print(error.localizedDescription)
            } else {
                print("User Registered successfully")
                // manually segue to logged in view
                
                self.performSegue(withIdentifier: "loginSegue", sender: nil);
                
            }
        }
        
        
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
