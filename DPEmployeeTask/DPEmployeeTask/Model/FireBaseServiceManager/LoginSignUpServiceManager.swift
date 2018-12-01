//
//  LoginFireBaseServiceManager.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class LoginFireBaseServiceManager: NSObject {

    
    //MARK::- Sending Data To FireBase
    
    func sendingDataToFireBase(_ loginData:SignUpModel, completionHandler:@escaping(SignUpModel,Error?) -> ()) {
        Auth.auth().createUser(withEmail: loginData.emailId ?? "", password: loginData.password ?? "") { (response, error) in
            
            if error != nil {
                AlertCentral.showAlertWithTitle(with: "Error", message: error?.localizedDescription ?? "")
                return
            }
            print(response?.uid)
            guard let userId = response?.uid else {
                return
            }
          let dataBaseStore = self.registerUsersIntoFireDataBase(uid: userId, dataModel: loginData)
            var signModel = SignUpModel()
            signModel.success = dataBaseStore
            
            DispatchQueue.main.async {
                completionHandler(signModel,error)
            }
        }
    }
    
    func registerUsersIntoFireDataBase(uid:String, dataModel:SignUpModel) -> String {
        let ref = Database.database().reference()   //fromURL: Constants.dataBaseUrl
        let userRef = ref.child("users").child(uid)
        var str = String()
        userRef.updateChildValues(self.generatingParameters(dataModel), withCompletionBlock: { (error, ref) in
            if error != nil {
                print(error!)
                AlertCentral.showAlertWithTitle(with: "Error", message: "")
            }
            str = "Success"
        })
        return str
    }
    
    func loginCallRequestApi(_ loginModel:LoginDataModel, completionHandler:@escaping(LoginDataModel,Error?) -> ()) {
        Auth.auth().signIn(withEmail: loginModel.email ?? "", password: loginModel.password ?? "") { (user, error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                AlertCentral.showAlertWithTitle(with: "Error", message: error?.localizedDescription ?? "")
                return
            }
            print(user)
            let loginModel = LoginDataModel()
            
            completionHandler(loginModel,error)
        }
    }
    
    //MARK::- Generating parameter(s)
    private func generatingParameters(_ dataModel:SignUpModel) -> [String:AnyObject] {
        var parameters:[String:AnyObject] = [:]
        parameters["email"] = dataModel.emailId as AnyObject
        parameters["password"] = dataModel.password as AnyObject
        parameters["firstName"] = dataModel.firstName as AnyObject
        parameters["lastName"] = dataModel.lastName as AnyObject
        parameters["dob"] = dataModel.dob as AnyObject
        parameters["gender"] = dataModel.gender as AnyObject
        parameters["designation"] = dataModel.designation as AnyObject
        return parameters
    }
}
