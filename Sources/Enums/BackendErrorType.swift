//
//  BackendErrorType.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public enum BackendErrorType: String, Error {
    // Custom errors (mainly from the API)
    case Custom
    
    
    // User
    case UserNotFound
    case AccountDeletionFailed
    case NoUserDetails
    case CannotSaveUserDetails
    
    // MARK: - Auth
    case IncorrectCredentials
    case NoEmailOrPassword
    
    // Login
    case LoginFailed
    case LoginConfirmFailed
    case SignInWithAppleFailed
    case SignInWithGoogleFailed
    case LogoutFailed
    
    // Sign Up
    case SignUpFailed
    case EmailAlreadyExists
    case EmailConfirmFailed
    case EmailAlreadyConfirmed
    case ConfirmEmailResendFailed
    
    // Reset Password
    case RequestResendPasswordFailed
    case ResetPasswordFailed
    case ResetPasswordByCurrentOneFailed
    
    case RecentlyChangedPassword
    
    
    
}
