//
//  APIManager.swift
//  Gymnastics
//
//  Created by Rakhi on 9/7/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import Foundation

typealias APICompletionHandler = (_ code:Int, _ error:NSError?, _ response:JSON) -> Void

class APIManager {
    
    static var instance: APIManager!
    
    // SHARED INSTANCE
    class func sharedAPIManager() -> APIManager {
        self.instance = (self.instance ?? APIManager())
        return self.instance
    }
    
    struct Constants {
        static let BASEURL = "http://45.79.169.241/gymnastic/"
        static let IMAGEURL = ""
        static let IMAGEUPLOADURL = ""
    }

    
    
    func callApi(strApiName:String, param: [String:Any]?,completionHandler:@escaping APICompletionHandler)
    {
        let strAPI = APIManager.Constants.BASEURL+strApiName
        print("API : \(strAPI)")
        
        Alamofire.request(strAPI, method: .post , parameters: param).responseJSON { (responseData) in
            
            let isSuccess = JSON(responseData.result.isSuccess)
            if isSuccess.boolValue {
                let jsonObject = JSON(responseData.result.value!)
                completionHandler(1, nil, jsonObject)
            } else {
                let error = responseData.result.error! as NSError
                //let jsonObject = [String:AnyObject];
                completionHandler(0, error, JSON.null)
            }
            
        }

        
//        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
//            if((responseData.result.value) != nil) {
//                let swiftyJsonVar = JSON(responseData.result.value!)
//                print(swiftyJsonVar)
//            }
//        }
        
        
    }
    
    
}

