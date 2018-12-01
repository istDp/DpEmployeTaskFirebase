//
//  EmployeeView.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

protocol EmployeeViewDelegate:class {
  func logoutBtnPsd()
}

class EmployeeView: UIView {
  
  //MARK::- IBOutlet(s) & Variable(s)
  
  @IBOutlet weak var tableView_employee: UITableView!
  weak var delegate:EmployeeViewDelegate?
  var userArrayModel = [UserModel]()
  
  override func awakeFromNib() {
    super.awakeFromNib()
    tableView_employee.tableFooterView = UIView()
  }
  
  //MARK::- Public Method(s)
  public func gettingEmployeeDetailsFromFireBase(_ dataModel:UserModel) {
    self.userArrayModel.append(dataModel)
    self.tableView_employee.reloadData()
  }
  
  //MARK::- IBAction Method(s)
  
  @IBAction func btn_logout(_ sender: Any) {
    self.delegate?.logoutBtnPsd()
  }
  
}


extension EmployeeView:UITableViewDelegate, UITableViewDataSource{
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return userArrayModel.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let detailCell = tableView.dequeueReusableCell(withIdentifier: "EmployeeCell", for: indexPath) as! EmployeeCell
    detailCell.gettingEmployeeDetails(userArrayModel[indexPath.row])
    return detailCell
  }
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 161
  }
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      deleteUsersFromDatabase(IndexPath: indexPath.row)
    }
  }
  //MARK::--- Delete users
  func deleteUsersFromDatabase(IndexPath:Int){
    let refUser = Database.database().reference().child("users").child(userArrayModel[IndexPath].id!)
    refUser.removeValue()
    userArrayModel.remove(at: IndexPath)
    tableView_employee.reloadData()
  }
  
  
}


