//
//  SignUpViewController.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    var signUpView:SignUpView?
    var loginFBmanager = LoginFireBaseServiceManager()

    override func viewDidLoad() {
        super.viewDidLoad()
    signUpView = self.view as? SignUpView
        signUpView?.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK::- Private Method(s)
    private func sendingsignUpDataToFireBase(_ dataModel:SignUpModel) {
        loginFBmanager.sendingDataToFireBase(dataModel) { (loginResponse, error) in
            
            if error != nil {
                
            }
            
            AlertCentral.displayAlertView(title: "Success", message: "Successfully Registered", style: .alert, actionButtonTitle: ["OK"], completionHandler: { (alert) in
                if loginResponse.success == "" {
                 self.navigationController?.popViewController(animated: true)
                }
            })
            
        }
    }
    
}


extension SignUpViewController:SignUpViewDelegate {
    
    func signUpDetailsSending(_ dataModel: SignUpModel) {
        self.sendingsignUpDataToFireBase(dataModel)
    }
    
    func backBtnPsd() {
        _ = self.navigationController?.popViewController(animated: true)
    }
    
}
