import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")

        Backend.shared.config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "bg", errors: [
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
        
        await Backend.shared.login(email: "georgievmarti21@gmail.com", password: "123Prudni@") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("------------------LOGIN--------------------")
        print("END PROGRAM")
    }
}
