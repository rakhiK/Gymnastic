

//
//  CommonMethod.swift
//  Gymnastics
//
//  Created by Rakhi on 9/7/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import Foundation
import TWMessageBarManager

class CommonMethod
{
    static var instance : CommonMethod!
    
    // SHARED INSTANCE
    class func sharedCommonMethod() -> CommonMethod {
        self.instance = (self.instance ?? CommonMethod())
        return self.instance
    }
    
    func errorAlert(strMsg:String)
    {
        TWMessageBarManager.sharedInstance().showMessage(withTitle:AppName,description:strMsg, type: .error)
    }
    
    func SuccessAlert(strMsg:String)
    {
        TWMessageBarManager.sharedInstance().showMessage(withTitle:AppName,description:strMsg, type: .success)
    }
    
    func ShowInfoAlert(strMsg:String)
    {
        TWMessageBarManager.sharedInstance().showMessage(withTitle:AppName,description:strMsg, type: .info)
    }


    
    
    
}
