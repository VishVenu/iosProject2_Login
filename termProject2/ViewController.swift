//
//  ViewController.swift
//  termProject2
//
//  Created by Parwat Kunwar on 2022-06-27.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        forgotPwdButton.contentHorizontalAlignment = UIControl.ContentHorizontalAlignment.right
        
    }
    
    private var welcomePageViewCtrl: WelcomePageViewController!

    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var forgotPwdButton: UIButton!
    
    let userId = "user1"
    let pwd = "pwd1"
    
    @IBAction func forgotPassword(_ sender: UIButton) {

    }

    @IBAction func login(_ sender: UIButton) {
        if (username.text!.isEmpty && password.text!.isEmpty) {
            let err = "Please enter username and password to login."
            return showAlert(err)
        }

        if(username.text!.isEmpty) {
            let err = "Please enter a username to login."
            return showAlert(err)
        }

        if(password.text!.isEmpty) {
            let err = "Please enter a password to login."
            return showAlert(err)
        }
        
        let doesCredentialsMatch = (username.text! == userId && password.text! == pwd) ? true : false
        
        if doesCredentialsMatch {
            welcomePageViewCtrl = storyboard?.instantiateViewController(withIdentifier: "WelcomePageViewController") as? WelcomePageViewController
            
            welcomePageViewCtrl.modalPresentationStyle = .fullScreen
            welcomePageViewCtrl.message = "Welcome \(userId)/\(pwd)"
            
            self.present(welcomePageViewCtrl, animated: true, completion: nil)
            self.navigationController?.pushViewController(welcomePageViewCtrl, animated: true)
            
        } else {
            let err = "Wrong username or password! \n Please try again."
            showAlert(err)
        }
    }
    
    func showAlert(_ message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
        alert.addAction(okAction)

        return present(alert, animated: true, completion: nil)
    }
    
    @IBAction func changePasswordVisibility(_ sender: UIButton) {
        password.isSecureTextEntry.toggle()
        if password.isSecureTextEntry {
            if let image = UIImage(systemName: "eye.fill") {
                sender.setImage(image, for: .normal)
            }
        } else {
            if let image = UIImage(systemName: "eye.slash.fill") {
                sender.setImage(image, for: .normal)
            }
        }
    }
}

