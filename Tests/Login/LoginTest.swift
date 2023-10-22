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

        Backend.shared.config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "en", errors: [BackendError(type: .Custom, localizedDescription: [
            BackendLocalizedError(language: "en", localizedDescription: "Working"),
            BackendLocalizedError(language: "bg", localizedDescription: "Работи"),
            BackendLocalizedError(language: "de", localizedDescription: "Arbeitet")
        ])])
        
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
