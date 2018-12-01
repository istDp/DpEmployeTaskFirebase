//
//  EmployeeViewController.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit
import FirebaseAuth

class EmployeeViewController: UIViewController {

    var employeeView:EmployeeView?
    var fetchDataServiceManager = FetchFireBaseUsersManager()

    
    override func viewDidLoad() {
        super.viewDidLoad()
     employeeView = self.view as? EmployeeView
      employeeView?.delegate = self
        self.fetchingDataFromFireBase()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    //MARK::- FetchingDataFromFireBase
    
    func fetchingDataFromFireBase() {
        fetchDataServiceManager.fetchingRegisterFriendsCallRequestApi { (response) in
            
            print(response)
            self.employeeView?.gettingEmployeeDetailsFromFireBase(response)
        }
    }
}


extension EmployeeViewController: EmployeeViewDelegate {

  func logoutBtnPsd() {
    do {
      try Auth.auth().signOut()
    } catch let err {
      print(err)
    }
    _ = self.navigationController?.popToRootViewController(animated: true)
    }
}


