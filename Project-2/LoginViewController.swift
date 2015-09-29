//
//  LoginViewController.swift
//  Project-2
//
//  Created by Chris Mikelson on 9/28/15.
//  Copyright © 2015 Chris Mikelson. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInTextImage: UIImageView!
    @IBOutlet weak var activitySpinnerOnSignIn: UIActivityIndicatorView!
    
    @IBAction func onBackButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func onSignIn(sender: AnyObject) {
        
        // Start the activity spinner
        activitySpinnerOnSignIn.startAnimating()
        
        delay(1) {
            // Stop the activity spinner
            self.activitySpinnerOnSignIn.stopAnimating()
            
            // Authentication
            if (self.emailTextField.text!.isEmpty) || (self.passwordTextField.text!.isEmpty) {
            
                // Blank sign in alert message
                let alertController = UIAlertController(title: "Missing Fields", message: "Please provide a valid email address and password to sign in.", preferredStyle: .Alert)
            
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                // handle response here.
                }
            
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
            
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            } else if (self.emailTextField.text == "e") && (self.passwordTextField.text == "p") {
                
                // Stop the activity spinner
                self.activitySpinnerOnSignIn.stopAnimating()
                self.performSegueWithIdentifier("signInSegue", sender: self )
                            
            } else {
                
                // Stop the activity spinner
                self.activitySpinnerOnSignIn.stopAnimating()
                
                // Failed sign in alert message
                let alertController = UIAlertController(title: "Access Denied", message: "Your email and password do not match. Please try again!", preferredStyle: .Alert)
                
                // create an OK action
                let OKAction = UIAlertAction(title: "OK", style: .Default) { (action) in
                    // handle response here.
                }
                // add the OK action to the alert controller
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
                
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activitySpinnerOnSignIn.hidden = true
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: "DismissKeyboard")
        view.addGestureRecognizer(tap)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Calls this function when the tap is recognized.
    func DismissKeyboard(){
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    // Grand Central Dispatch function
    func delay(delay:Double, closure:()->()) {
        dispatch_after(
            dispatch_time(
                DISPATCH_TIME_NOW,
                Int64(delay * Double(NSEC_PER_SEC))
            ),
            dispatch_get_main_queue(), closure)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
