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
        
        await Backend.shared.loginConfirm(email: "georgievmarti21@gmail.com", token: "9480fc42d0f40519d4bb39ad8de8d305075469d897b43e5a3f8f24d1077ed8ee") { status in
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
