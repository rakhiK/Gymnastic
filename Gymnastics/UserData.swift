//
//  UserData.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class UserData: NSObject {
    
    var userID : Int?
    var resultCode : Int?
    var message : String?
    var username : String?
    var email : String?
    
    init(jsonData : JSON) {
        super.init()
        updateData(json: jsonData)
    }
    
    func updateData(json : JSON)
    {
        userID = json["user_id"].int
        resultCode = json["ResultCode"].int
        message = json["Message"].string
        username = json["username"].string
        email = json["email"].string
    }


}
