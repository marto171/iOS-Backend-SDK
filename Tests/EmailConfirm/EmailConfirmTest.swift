import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginConfirmTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        
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
        
        await Backend.shared.emailConfirm(email: "georgievmarti21@gmail.com", token: "d3fb8f90660b351bf8e997487784726f6e23ceedff285d376bc0104574cf92e0") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("------------------EMAILCONFIRM--------------------")
        print("END PROGRAM")
    }
}
