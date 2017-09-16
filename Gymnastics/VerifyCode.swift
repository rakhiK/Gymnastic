//
//  VerifyCode.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class VerifyCode: UIViewController {
    
    //IBOutlet Declaration
    @IBOutlet weak var txtVerifyCode: UITextField!
    
    //Variable Declaration

    // Mark : Back Action
    @IBAction func BackClick()
    {
        self.navigationController?.popViewController(animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK:: UIbutton Action
    
    @IBAction func actionSignIn(_ sender: UIButton) {
        
    }
    
    
    @IBAction func actionSignUp(_ sender: UIButton) {
        
        if txtVerifyCode.text?.characters.count != 0
        {
            print(UserDefaults.standard.integer(forKey: "userid"))
            let dic = ["user_id" : UserDefaults.standard.integer(forKey:"userid"),"code" : txtVerifyCode.text ?? ""] as [String : Any]
            
            objApiManager.callApi(strApiName: VERIFYCODE, param: dic, completionHandler: { (code, err, response) in
                
                if err == nil
                {
                    print(response)
                }
                else
                {
                    print(err?.localizedDescription ?? "")
                }
                
            })
        }
        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
