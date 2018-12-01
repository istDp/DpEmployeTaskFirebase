//
//  EmployeeCell.swift
//  DPEmployeeTask
//
//  Created by Admin on 13/07/18.
//  Copyright © 2018 Dp It Solutions. All rights reserved.
//

import UIKit

class EmployeeCell: UITableViewCell {

    @IBOutlet weak var lbl_name: UILabel!
    
    @IBOutlet weak var lbl_email: UILabel!
    
    @IBOutlet weak var lbl_dob: UILabel!
    
    @IBOutlet weak var lbl_Gender: UILabel!
    
    @IBOutlet weak var lbl_designation: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func gettingEmployeeDetails(_ dataModel:UserModel) {
        if let name = dataModel.firstName , let ls = dataModel.lastName{
            self.lbl_name.text = "FULLNAME -:  " + name + ls
        }
        if let emmail = dataModel.emailId {
            self.lbl_email.text = "EMAIL -:  " + emmail
        }
        if let dobb = dataModel.dob {
        self.lbl_dob.text = "DOB -:  " + dobb
        }
        if let gend = dataModel.gender {
        self.lbl_Gender.text = "GENDER :-  " + gend
        }
        if let des = dataModel.designation {
        self.lbl_designation.text = "DESIGNATION :-  " + des
        }
    }
    
}
