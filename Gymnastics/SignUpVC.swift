//
//  SignUpVC.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class SignUpVC: UIViewController {
    
    //Constant
    struct Constant
    {
        struct Storyboard
        {
            static let signUpCell = "TxtFieldCell"
        }
        static let indexConstant = 100
    }
    
    //IBOutlet Declaration
    @IBOutlet weak var tblSignUp: UITableView!
    
    
    //Variable Declaraiton
    var strUsername : String?
    var strPassword : String?
    var strConfirmPasswd : String?
    var strEmail : String?

    // Mark : Back Action
    @IBAction func BackClick()
    {
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //Validation 
    
    func validationField() -> Bool
    {
        if strUsername?.characters.count == 0 || strUsername == nil
        {
            objCommonMethod.errorAlert(strMsg: ValidateUserName)
            return false
        }
        if strEmail?.characters.count == 0 || strEmail == nil
        {
            objCommonMethod.errorAlert(strMsg: ValidateEmail)
            return false
        }
        
        if strEmail?.characters.count != 0
        {
            if objValidation.emailValidation(strEmail: strEmail!)
            {
                return true
            }
            objCommonMethod.errorAlert(strMsg: ValidateCorrectEmail)
            return false
        }
        
       if strPassword?.characters.count == 0 || strPassword == nil
        {
            objCommonMethod.errorAlert(strMsg: ValidatePassword)
            return false
        }
//        else if strPassword?.characters.count != 0
//        {
//            if objValidation.emailValidation(strEmail: strEmail!)
//            {
//                return true
//            }
//            objCommonMethod.errorAlert(strMsg: "")
//            return false
//        }
     else if strConfirmPasswd?.characters.count == 0
        {
            objCommonMethod.errorAlert(strMsg: ValidateConfirmpassword)
            return false
        }
        else if strConfirmPasswd != strPassword
        {
            objCommonMethod.errorAlert(strMsg: ValidateMatchPassword)
            return false
        }
        return true

    }
    
    //MARK:: UIButton Action
    @IBAction func actionNext(_ sender: UIButton) {
        
        if validationField()
        {
            let dic = ["username" : strUsername!,"email" : strEmail!,"password": strPassword!]
            print(dic)
            objApiManager.callApi(strApiName: REGISTER, param: dic, completionHandler: { (code, err, response) in
                
                if err == nil
                {
                    print(response)
                    
                    let objUserModel = UserData.init(jsonData: response)
                    if objUserModel.resultCode == 1
                    {
                        objCommonMethod.SuccessAlert(strMsg: objUserModel.message ?? "")
                        
                        UserDefaults.standard.set("YES", forKey: "ISLOGIN") //Bool
                        UserDefaults.standard.synchronize()
                        
                        UserDefaults.standard.set(objUserModel.userID, forKey: "userid")
                        UserDefaults.standard.synchronize()
                        let obj = self.storyboard?.instantiateViewController(withIdentifier: "VerifyCode") as! VerifyCode
                        self.navigationController?.pushViewController(obj, animated: true)
                       
                    }
                    else if objUserModel.resultCode == 0
                    {
                        objCommonMethod.errorAlert(strMsg: objUserModel.message!)
                    }
                    
                }
                else
                {
                    print(err?.localizedDescription ?? "")
                }
                
            })
        }
    }

    

}
extension SignUpVC: UITableViewDelegate, UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Storyboard.signUpCell) as! TxtFieldCell
            cell.selectionStyle = .none
            cell.txtField.tag = indexPath.row + Constant.indexConstant
            cell.txtField.placeholder = "Sandra Williams"
            cell.lblName.text = "Username"
            cell.txtField.isSecureTextEntry = false
            
            cell.txtField.text = strUsername

            return cell
        }
        else if indexPath.row == 1
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Storyboard.signUpCell) as! TxtFieldCell
            cell.selectionStyle = .none
            cell.txtField.tag = indexPath.row + Constant.indexConstant
            cell.txtField.placeholder = "sandra@gmail.com"
            cell.lblName.text = "Email"
            cell.txtField.isSecureTextEntry = false
            
            cell.txtField.text = strEmail
            
            return cell
        }
        else if indexPath.row == 2
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Storyboard.signUpCell) as! TxtFieldCell
            cell.selectionStyle = .none
            cell.txtField.tag = indexPath.row + Constant.indexConstant
            cell.txtField.placeholder = "12345"
            cell.txtField.isSecureTextEntry = true
            cell.lblName.text = "Password"
            
            cell.txtField.text = strPassword
           
            return cell
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: Constant.Storyboard.signUpCell) as! TxtFieldCell
            cell.txtField.tag = indexPath.row + Constant.indexConstant
            cell.selectionStyle = .none
            cell.txtField.isSecureTextEntry = true
            cell.txtField.placeholder = "12345"
            cell.lblName.text = "Conform Password"

            cell.txtField.text = strConfirmPasswd
            
            return cell
        }
    }
}

extension SignUpVC : UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if textField.tag == 100
        {
            let myCharSet:NSCharacterSet = NSCharacterSet(charactersIn:nameRengEx)
            for i : Int in 0 ..< string.characters.count
            {
                let c : unichar = NSString(string: string).character(at: i)
                if myCharSet.characterIsMember(c)
                {
                    strUsername = textField.text
                    return true
                }else{
                    return false
                }
            }
        }
        
        if textField.tag == 101
        {
            strEmail = textField.text
        }
        if textField.tag == 102
        {
            strPassword = textField.text
        }

        if textField.tag == 103
        {
            strConfirmPasswd = textField.text
        }

        return true
    }
}

