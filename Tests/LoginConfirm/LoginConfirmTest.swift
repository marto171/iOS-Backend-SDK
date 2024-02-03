import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginConfirmTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        
//        Backend.shared.config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "en", errors: [
//            BackendError(type: .EmailAlreadyExists, localizedDescription: [
//                LocalizedError(language: "en", localizedDescription: "Working email already exists."),
//                LocalizedError(language: "bg", localizedDescription: "Работи email already exists."),
//                LocalizedError(language: "de", localizedDescription: "Arbeitet email already exists.")
//            ]),
//            BackendError(type: .IncorrectCredentials, localizedDescription: [
//                LocalizedError(language: "en", localizedDescription: "Working email or password is not correct!"),
//                LocalizedError(language: "bg", localizedDescription: "Работи email or password is not correct!"),
//                LocalizedError(language: "de", localizedDescription: "Arbeitet email or password is not correct!")
//            ])
//        ])
        
        await Backend.shared.loginConfirm(email: "georgievmarti21@gmail.com", token: "6e753833f76f8b3b751ea1b03ba879012ff6e6d3543e4ba4733edb4636c2f369") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("------------------LOGINCONFIRM--------------------")
        print("END PROGRAM")
    }
}
