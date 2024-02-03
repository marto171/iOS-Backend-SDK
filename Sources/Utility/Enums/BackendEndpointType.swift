//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 3.02.24.
//

import Foundation

public enum BackendEndpointType: Equatable {
    // Before Auth
    case login
    case loginConfirm(token: String)
    case signup
    case emailConfirm(token: String)
    case resendConfirmEmail
    case logout
    case requestResetPassword
    case resetPassword(token: String)
    case resetPasswordByCurrentOne
    case signInWithApple
    case signInWithGoogle
    
    // User
    case getUser
    case getUserDetails
    case createUserDetails
    case updateUser
    case deleteUser
}
