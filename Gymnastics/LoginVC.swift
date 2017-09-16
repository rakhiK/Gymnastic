//
//  LoginVC.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    
    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var txtPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func navigateToNextView()
    {
        DispatchQueue.main.async
            {
         AppDelObj.setTabbar()
        }
    }
    
    //MARK::- Button Action
    @IBAction func actionSignIn(_ sender: UIButton) {
        
        let dic = ["email" : "krupa.karathia@gmail.com","password" : "knk1982"]
        
        objApiManager.callApi(strApiName: LOGIN, param: dic, completionHandler: { (code, err, response) in
            
            if err == nil
            {
                print(response)
                let objUserModel = UserData.init(jsonData: response)
                if objUserModel.resultCode == 1
                {
                    objCommonMethod.SuccessAlert(strMsg: objUserModel.message ?? "")
                    UserDefaults.standard.set("YES", forKey: "ISLOGIN") //Bool
                    UserDefaults.standard.synchronize()
                    self.navigateToNextView()
                }
            }
            else
            {
                print(err?.localizedDescription ?? "")
            }
            
        })


    }
}

extension LoginVC : UITextFieldDelegate
{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return true
    }
    
}
