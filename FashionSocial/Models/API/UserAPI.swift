//
//  UserAPI.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 10/23/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class UserAPI: NSObject {
    class func loginWithFacebook(facebookAccessToken: String, completion: ()->Void, failure:(error: String)->Void) {
        var params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
        params["facebook_access_token"] = facebookAccessToken
        
        ModelManager.shareManager.postRequest("user/loginWithFacebook", params: params, success: { (responseData) -> Void in
            
            if let arrData: Dictionary<String, AnyObject> = responseData as? Dictionary<String, AnyObject> {
                let userObj = UserObject()
                userObj.userID = Utilities.numberFromJSONAnyObject(arrData["id"])!.integerValue
                userObj.userName = arrData["username"] as? String ?? ""
                
//                singletion class
                UserObject.sharedUser = userObj
                UserObject.sharedUser.saveOffline()
                completion()
            }
            
            }) { (errorMessage) -> Void in
                failure(error: errorMessage)
        }
    }
}
