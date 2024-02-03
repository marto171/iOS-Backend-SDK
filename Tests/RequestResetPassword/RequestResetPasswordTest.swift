import XCTest
import iOS_Backend_SDK

@MainActor
final class SignupTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        
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
        
        await Backend.shared.requestResetPassword(email: "georgievmarti21@gmail.com") { status in
            switch status {
            case .success(let response):
                print(response.message)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("------------------REQUESTRESETPASSWORD--------------------")
        print("END PROGRAM")
    }
}
