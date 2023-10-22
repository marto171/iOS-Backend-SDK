//
//  BackendErrorType.swift
//
//
//  Created by Martin on 21.10.23.
//

import Foundation

public enum BackendErrorType: String, Error {
    case Custom
    
    case EmailNotVerified
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
}
