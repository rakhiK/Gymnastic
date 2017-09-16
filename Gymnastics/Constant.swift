//
//  Constant.swift
//  Gymnastics
//
//  Created by Rakhi on 9/7/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import Foundation

//API
//http://45.79.169.241/gymnastic/register/verify_email
let REGISTER    =      "register/gymnastic"
let LOGIN       =       "login/gymnastic"
let VERIFYCODE  =       "verify_email"

//Singleton Variable
let objApiManager = APIManager.sharedAPIManager()
let objCommonMethod = CommonMethod.sharedCommonMethod()
let objValidation = Validation.sharedValidation()
let AppDelObj : AppDelegate = AppDelegate().sharedInstance()

//Validation Error

let ValidateUserName = "Please Enter Username"
let ValidateEmail = "Please Enter Email"
let ValidatePassword = "Please Enter Password"
let ValidateConfirmpassword = "Please Enter Confirm Password"
let ValidateMatchPassword = "Password Should Match"
let ValidateCorrectEmail = "Please Enter valid Email"

//Constant Variable
let AppName = "Gymnastic"
let nameRengEx = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
let emailRegEx = "(?:[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-zA-Z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?\\.)+[a-zA-Z0-9](?:[a-zA-Z0-9-]*[a-zA-Z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-zA-Z0-9-]*[a-zA-Z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"

