//
//  Validation.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import Foundation


class Validation
{
    static var instance : Validation!
    
    class func sharedValidation() -> Validation {
        self.instance = (self.instance ?? Validation())
        return self.instance
    }
    func emailValidation(strEmail : String)-> Bool
    {
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let isTrue : Bool =  emailTest.evaluate(with: strEmail)
        if(isTrue == false)
        {
            return false
        }
        return true
    }
    
    func passwordValidation(strEmail : String)-> Bool
    {
        return true
    }
}
