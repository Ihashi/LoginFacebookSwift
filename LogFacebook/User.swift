//
//  User.swift
//  LogFacebook
//
//  Created by ESIEA on 06/05/2015.
//  Copyright (c) 2015 HaiNguyen. All rights reserved.
//

import Foundation

struct User {
    typealias Id = String
    
    let id: Id
    let email: String
    let username: String
    let facebookUserId: String
    
    init?(fromNSDictionary dict: NSDictionary) {
        if let id = dict["id"] as? Id,
            email = dict["email"] as? String,
            username = dict["username"] as? String,
            facebookUserId = dict["facebookUserId"] as? String {
                self.id = id
                self.email = email
                self.username = username
                self.facebookUserId = facebookUserId
        } else {
            return nil
        }
    }
    
    static func loginFacebook(complete: (User) -> Void) {
        SizWebAPI.loginByFacebook() {
            (jsonUser) -> Void in
            if let user = User(fromNSDictionary: jsonUser) {
                complete(user)
            }
        }
    }
}