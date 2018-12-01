//
//  FetchFireBaseUsersManager.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import Foundation
import FirebaseDatabase
import Firebase


class FetchFireBaseUsersManager: NSObject {
    
    
    func fetchingRegisterFriendsCallRequestApi(completionHandler:@escaping(UserModel) -> ()) {
        
        Database.database().reference().child("users").observe(.childAdded, with: { (fetchUses) in
            
            print(fetchUses)
            let responseDict = fetchUses.value as? [String:Any]
            let userModel = UserModel()
            userModel.id = fetchUses.key
            userModel.firstName = responseDict?["firstName"] as? String
            userModel.password = responseDict?["password"] as? String
            print(userModel.firstName ?? "")
            userModel.emailId = responseDict?["email"] as? String
            print(userModel.emailId ?? "")
            userModel.lastName = responseDict?["lastName"] as? String
            userModel.dob = responseDict?["dob"] as? String
            userModel.gender = responseDict?["gender"] as? String
            userModel.designation = responseDict?["designation"] as? String
            userModel.id = fetchUses.key
            completionHandler(userModel)
            
        }) { (error) in
            print(error)
            AlertCentral.showAlertWithTitle(with: "Alert", message: error.localizedDescription )
            return
            
        }
    }
}
