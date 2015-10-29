//
//  PostAPI.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 10/29/15.
//  Copyright © 2015 SkyDance. All rights reserved.
//

import UIKit

class PostAPI: NSObject {
    class func getPostListOfUser(userId: Int, limit: Int, offset: Int, completion:(postList: [PostObject])->Void, failure:(error: String)->Void) {
        var params: Dictionary<String, AnyObject> = Dictionary<String, AnyObject>()
        params["user_id"] = userId
        params["limit"] = limit
        params["offset"] = offset
        
        
        ModelManager.shareManager.getRequest("post/getPostByUser", params: params, success: { (responseData) -> Void in
            
            if let arr: Array<AnyObject> = responseData["data"] as? Array<AnyObject> {
                var _senderPosts: [PostObject] = []
                for obj in arr {
                    let _postObj = PostObject()
                    
                    _postObj.title = obj["location"] as? String ?? ""
                    _senderPosts.append(_postObj)
                }
                completion(postList: _senderPosts)
            }
            
            
            
            }) { (errorMessage) -> Void in
                failure(error: errorMessage)
        }
    }
}
