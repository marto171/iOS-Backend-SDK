//
//  File.swift
//  
//
//  Created by Kaloyan Petkov on 3.02.24.
//

import Foundation

public enum BackendEndpointType {
    // Before Auth
    case login
    case loginConfirm
    case signup
    case emailConfirm
    case resendConfirmEmail
    case logout
    case requestResetPassword
    case resetPassword
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
