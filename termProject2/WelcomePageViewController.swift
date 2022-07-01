//
//  WelcomePageViewController.swift
//  termProject2
//
//  Created by Parwat Kunwar on 2022-06-27.
//

import Foundation
import UIKit

class WelcomePageViewController: UIViewController {
    
//    private var calcViewCtrl: CalculatorViewController!
//    private var changePwdViewCtrl: ChangePasswordViewController!
    
    var message: String?
    
    @IBOutlet weak var messgaeLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        messgaeLbl.text = message
    }
    
    @IBAction func navigateCalculatorView(_ sender: UIButton) {
//        calcViewCtrl = storyboard?.instantiateViewController(withIdentifier: "CalculatorViewController") as? CalculatorViewController
//
//        calcViewCtrl.modalPresentationStyle = .fullScreen
//        self.present(calcViewCtrl, animated: true, completion: nil)
//        self.navigationController?.pushViewController(calcViewCtrl, animated: true)
    }

    @IBAction func navigateToChangePwdView(_ sender: UIButton) {
//        changePwdViewCtrl = storyboard?.instantiateViewController(withIdentifier: "ChangePasswordViewController") as? ChangePasswordViewController
//
//        changePwdViewCtrl.modalPresentationStyle = .fullScreen
//        self.present(changePwdViewCtrl, animated: true, completion: nil)
//        self.navigationController?.pushViewController(changePwdViewCtrl, animated: true)
    }
}
