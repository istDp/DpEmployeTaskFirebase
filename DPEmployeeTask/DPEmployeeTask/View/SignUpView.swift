//
//  SignUpView.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit


protocol SignUpViewDelegate:class {
    func signUpDetailsSending(_ dataModel:SignUpModel)
    func backBtnPsd()
}

class SignUpView: UIView {

    //MARK::- IBOutlet(s) & Variable(s)
    
    @IBOutlet weak var tableView_signUp: UITableView!
    
    weak var delegate:SignUpViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    //MARK::- IBAction Method(s)
    
    @IBAction func btn_backPressed(_ sender: Any) {
        delegate?.backBtnPsd()
    }
    

}


extension SignUpView:UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SignUpTableViewCell", for: indexPath) as! SignUpTableViewCell
        cell.delegate = self
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 528
    }
}


extension SignUpView:SignUpTableViewCellDelegate {
    
    func signUpBtnPsd(_ dataModel: SignUpModel) {
        delegate?.signUpDetailsSending(dataModel)
    }
    
}


