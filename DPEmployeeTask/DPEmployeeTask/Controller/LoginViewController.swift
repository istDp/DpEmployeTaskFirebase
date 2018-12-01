//
//  LoginViewController.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    //MARK::- IBOutlet(s) & Variable(s)

    var loginView:LoginView?
    var loginFBmanager = LoginFireBaseServiceManager()

    //MARK::- Override Method(s)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginView = self.view as? LoginView
        loginView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sendingLoginDataToFireBase(_ loginData:LoginDataModel) {
        loginFBmanager.loginCallRequestApi(loginData) { (response, error) in
            
            if error != nil {
              return
            }
            AlertCentral.displayAlertView(title: "", message: "Successful", style: .alert, actionButtonTitle: ["OK"], completionHandler: { (alert) in
                
                let employeeVc = AppDelegate.sharedInstance().mainStoryBoard?.instantiateViewController(withIdentifier: "EmployeeViewController") as! EmployeeViewController
                self.navigationController?.pushViewController(employeeVc, animated: true)
                
            })
        }
    
   }
}

extension LoginViewController: LoginViewDelegate {
    func signUpBtnPsd() {
        let signUpVc = AppDelegate.sharedInstance().mainStoryBoard?.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(signUpVc, animated: true)
    }
    
    func sendingLoginDataToServer(_ loginData: LoginDataModel) {
        self.sendingLoginDataToFireBase(loginData)
    }
}
