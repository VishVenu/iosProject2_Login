//
//  ChangePasswordViewController.swift
//  termProject2
//
//  Created by Vishakha Venugopal on 30/06/22.
//

import UIKit

class ChangePasswordViewController: UIViewController {
    
    @IBOutlet weak var oldPasswordLbl: UITextField!
    
    @IBOutlet weak var newPasswordLbl: UITextField!
    
    private var existingPassword:String! = Credentials.password
    
    private var validationMessage:String! = ""
    
    private var welcomePageViewCtrl: WelcomePageViewController!
    
    private var loginViewCtrl: ViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnDone(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    @IBAction func OnChangePasswordClicked(_ sender: UIButton) {
        validatePassword()
    }
    
    private func validatePassword(){
        var isError = true
        
        if (oldPasswordLbl.text?.isEmpty)! || (newPasswordLbl.text?.isEmpty)!{
            validationMessage = "Please enter all the values"
        }else if oldPasswordLbl.text != existingPassword{
            validationMessage = "Incorrect old password"
        }else
        {
            Credentials.password = newPasswordLbl.text!
            validationMessage = "Password changed succesfully!"
            isError = false
            
        }
        
        let title = isError ? "Error" : "Success"
        showAlert(title: title, message: validationMessage, shouldNavigateToLogin: !isError)
    }
    
    
    private func showAlert(title:String, message:String, shouldNavigateToLogin : Bool){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: .destructive, handler: { action in
            self.onAlertDismissed(shouldNavigateToLogin: shouldNavigateToLogin)
        }))
        
        present(alert, animated: true, completion: nil)
        
        return
        
        
    }
    
    func onAlertDismissed(shouldNavigateToLogin : Bool){
        if(shouldNavigateToLogin)
        {
            loginViewCtrl = storyboard?.instantiateViewController(withIdentifier: "ViewController") as? ViewController
            
            loginViewCtrl.modalPresentationStyle = .fullScreen
            self.present(loginViewCtrl, animated: true, completion: nil)
            self.navigationController?.pushViewController(loginViewCtrl, animated: true)
            
        }
    }
}

