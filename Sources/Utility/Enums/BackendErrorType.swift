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
    
    // Errors that don't need to be handled
    case EmailNotVerified
    
    // Errors that need to be handled in the configuration
    case IncorrectCredentials
    case EmailAlreadyExists
    case UserNotFound
    case InvalidToken
    case EmailAlreadyConfirmed
    case NoEmailOrPassword
    case NoPermission
    case NotLoggedIn
    case RecentlyChangedPassword
    case InvalidId
    case NoUserDetails
    case CannotSaveUserDetails
    case SignInWithAppleFailed
    case SignInWithGoogleFailed
    case AccountDeletionFailed
}
