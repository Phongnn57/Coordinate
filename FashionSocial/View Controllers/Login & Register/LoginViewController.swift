//
//  LoginViewController.swift
//  FashionSocial
//
//  Created by Nguyen Nam Phong on 8/29/15.
//  Copyright (c) 2015 SkyDance. All rights reserved.
//

import UIKit

class LoginViewController: BaseViewController {

    @IBOutlet weak var btnSkip: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    
    var email: String!
    var gender: Int = 0
    var avatar: String!
    var name: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.initialize()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func initialize() {
        self.btnLogin.layer.cornerRadius = (SCREEN_SIZE.width - 80) / 12
        self.navigationController?.navigationBarHidden = true
    }
    
    // MARK: BUTTON ACTION
    @IBAction func goToAppWithoutLogin(sender: AnyObject) {
        DELEGATE.startApp()
    }
    
    @IBAction func doLoginWithFacebook(sender: AnyObject) {
        if(FBSDKAccessToken.currentAccessToken() != nil){
            self.getUserProfile({ () -> Void in

                
                UserAPI.loginWithFacebook(FBSDKAccessToken.currentAccessToken().tokenString, completion: { () -> Void in
                    self.gotoWelcomePage()
                    }, failure: { (error) -> Void in
                        self.view.makeToast(error)
                })
                
                
            })
        }else{
            let login = FBSDKLoginManager()
            login.logInWithReadPermissions(["email", "public_profile"], fromViewController: self, handler: { (result: FBSDKLoginManagerLoginResult!, error: NSError!) -> Void in
                if (error == nil && !result.isCancelled && result.grantedPermissions.contains("email")) {
                    self.getUserProfile({ () -> Void in

                        UserAPI.loginWithFacebook(FBSDKAccessToken.currentAccessToken().tokenString, completion: { () -> Void in
                            self.gotoWelcomePage()
                            }, failure: { (error) -> Void in
                                self.view.makeToast(error)
                        })
                    })
                }
            })
        }
    }
    
    func gotoWelcomePage() {
        let welcomePageViewController = WelcomeViewController()
        self.navigationController?.pushViewController(welcomePageViewController, animated: true)
    }
    
    func getUserProfile(completion:()->Void) {
        MRProgressOverlayView.showOverlayAddedTo(self.view, title: "", mode: MRProgressOverlayViewMode.IndeterminateSmall, animated: true)
        FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, gender, picture.type(large), email"]).startWithCompletionHandler({ (connection, result, error) -> Void in
            if (error == nil){
                if let _email = result["email"] as? String {
                    self.email = _email
                    UserObject.sharedUser.email = self.email
                }
                if let _gender = result["gender"] as? String {
                    if _gender == "male" {
                        self.gender = 0
                    } else if _gender == "female" {
                        self.gender = 1
                    }
                    UserObject.sharedUser.gender = self.gender
                }
                if let _name = result["name"] as? String {
                    self.name = _name
                    UserObject.sharedUser.name = self.name
                }
                
                if let _picture = result["picture"] as? Dictionary<String, AnyObject> {
                    if let _data = _picture["data"] as? Dictionary<String, AnyObject> {
                        if let _photoURL = _data["url"] as? String {
                            self.avatar = _photoURL
                            UserObject.sharedUser.photoURL = self.avatar
                        }
                    }
                }
                UserObject.sharedUser.photoURL = "https://graph.facebook.com/\(FBSDKAccessToken.currentAccessToken().userID)/picture?width=90&height=90"
                UserObject.sharedUser.saveOffline()
                MRProgressOverlayView.dismissOverlayForView(self.view, animated: true)
                completion()
            }
        })
    }

}
