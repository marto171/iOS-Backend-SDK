//
//  CustomError.swift
//  
//
//  Created by Martin on 21.10.23.
//

import Foundation

public enum BackendErrorType: Error {
    case Custom // error that is not defined
    
    case APIConnectionError
    case FetchUserFromDbFail
    case ServerConnectionError
    case UpdatePasswordFail
    
    case SignUpFail
    
    case EmailResendFail
    case ConfirmEmailResendFail
    
    case RestorePasswordFail
    
    case NoActiveUser
    case DataRefreshError
    case SaveProfileSettingsFail
    case FinishSetupError
    case NoUserDetails
    case SearchError
}
