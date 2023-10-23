import XCTest
import iOS_Backend_SDK

@MainActor
final class SignupTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        
        Backend.shared.config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "en", errors: [
            BackendError(type: .EmailAlreadyExists, localizedDescription: [
                LocalizedError(language: "en", localizedDescription: "Working email already exists."),
                LocalizedError(language: "bg", localizedDescription: "Работи email already exists."),
                LocalizedError(language: "de", localizedDescription: "Arbeitet email already exists.")
            ]),
            BackendError(type: .IncorrectCredentials, localizedDescription: [
                LocalizedError(language: "en", localizedDescription: "Working email or password is not correct!"),
                LocalizedError(language: "bg", localizedDescription: "Работи email or password is not correct!"),
                LocalizedError(language: "de", localizedDescription: "Arbeitet email or password is not correct!")
            ])
        ])
        
        await Backend.shared.resetPassword(token: "ebd42db59054cc88213156670aa22cfebdfb13aa8c6ed8072c92447be757bdb6", email: "georgievmarti21@gmail.com", password: "Az@dert123gg", confirmPassword: "Az@dert123gg") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("------------------RESETPASSWORD--------------------")
        print("END PROGRAM")
    }
}
