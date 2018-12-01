

import UIKit

protocol SignUpTableViewCellDelegate:class {
    func signUpBtnPsd(_ dataModel:SignUpModel)
}

class SignUpTableViewCell: UITableViewCell {

    @IBOutlet weak var tf_firstName: UITextField!
    @IBOutlet weak var tf_lastName: UITextField!
    @IBOutlet weak var tf_emailId: UITextField!
    @IBOutlet weak var tf_dob: UITextField!
    @IBOutlet weak var tf_gender: UITextField!
    @IBOutlet weak var tf_designation: UITextField!
    @IBOutlet weak var tf_password: UITextField!
    
    weak var delegate:SignUpTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    //MARK::- Private Method(s)
    private func sendingSignUpDetails() -> SignUpModel {
    let dataModel = SignUpModel()
        dataModel.firstName = self.tf_firstName.text
        dataModel.lastName = self.tf_lastName.text
        dataModel.emailId = self.tf_emailId.text
        dataModel.dob = self.tf_dob.text
        dataModel.gender = self.tf_gender.text
        dataModel.password = self.tf_password.text
      dataModel.designation = self.tf_designation.text
    return dataModel
    }
    
    
    @IBAction func btn_signUpPsd(_ sender: UIButton) {
      let dignUpDetails = self.sendingSignUpDetails()
     self.delegate?.signUpBtnPsd(dignUpDetails)
    }
}
