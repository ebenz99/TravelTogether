//
//  SUViewController.swift
//  TravelTogether
//
//  Created by Ethan Bensman on 1/2/19.
//  Copyright © 2019 Ethan Bensman. All rights reserved.
//

import UIKit
import FirebaseAuth

class SUViewController: UIViewController {
    @IBOutlet weak var vwContainer: UIView!
    @IBOutlet weak var fbutton: UIButton!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            self.vwContainer.alpha = 0.0
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                self.fbutton.sendActions(for: .touchUpInside)
            }
 
    }
    
    @IBAction func showViewWithAnimations(_ sender: Any) {
        if self.vwContainer.alpha == 0.0 {
            UIView.animate(withDuration: 1.5, delay: 1.2, options:.curveEaseOut, animations: {
                    self.vwContainer.alpha=1.0
                })
        }
        else{
            UIView.animate(withDuration: 1.5, delay: 1.2, options:.curveEaseOut, animations: {
                self.vwContainer.alpha=0.0
            })
        }
    }
    @IBAction func signUpAction(_ sender: Any) {
        if password.text != confirmPassword.text {
            let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            
            alertController.addAction(defaultAction)
            self.present(alertController, animated: true, completion: nil)
        }
        else{
            Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
                if error == nil {
                    self.performSegue(withIdentifier: "signupToHome", sender: self)
                    print("Success")
                }
                else{
                    print("Error info: \(error)")
                    let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
