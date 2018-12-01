//
//  LoginView.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit

protocol LoginViewDelegate:class {
    func sendingLoginDataToServer(_ loginData:LoginDataModel)
    func signUpBtnPsd()
}

class LoginView: UIView {

    //MARK::- IBOutlet(s) & Variable(s)
    
    @IBOutlet weak var tf_email: UITextField!
    
    @IBOutlet weak var tf_password: UITextField!
    
    @IBOutlet weak var btn_login: UIButton!
    
    @IBOutlet weak var btn_signUp: UIButton!
    
    weak var delegate:LoginViewDelegate?
    
    //MARK::- Override Method(s)
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    //MARK::- Public Method(s)
    
    public func sendingLoginDataToFireBase() -> LoginDataModel {
        let loginModel = LoginDataModel()
        loginModel.email = self.tf_email.text
        loginModel.password = self.tf_password.text
        return loginModel
    }
    
    //MARK::- IBAction Method(s)
    
    
    @IBAction func loginBtnPsd(_ sender: Any) {
        let loginModel = sendingLoginDataToFireBase()
        self.delegate?.sendingLoginDataToServer(loginModel)
    }
    
    @IBAction func signUpBtnPsd(_ sender: Any) {
        self.delegate?.signUpBtnPsd()
    }
}
