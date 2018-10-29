//
//  LoginViewController.swift
//  Series
//
//  Created by ÁLVARO BARRADO FERNÁNDEZ on 1/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var userTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    let myUser = "user"
    let myPass = "1234"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loginButton.layer.cornerRadius=5.0
        loginButton.layer.masksToBounds=true
        loginButton.layer.borderWidth=2.0
        loginButton.layer.borderColor=UIColor.white.cgColor
        
        loginButton.setTitle(NSLocalizedString("title_login_button", comment: ""), for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func showSeriesVC(){
        let seriesVC = SeriesViewController()
        let navigationController = UINavigationController(rootViewController: seriesVC)
        present(navigationController, animated: true, completion: nil)
    }
    @IBAction func loginButtonPressed(){
        if let userText = userTextField.text, let passText = passTextField.text{

            if userText == myUser && passText == myPass{
                print("Log OK")
                showSeriesVC()
            }else{
                print("Log Fail")
            }
            
        }else{
            print("Log Fail")
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
