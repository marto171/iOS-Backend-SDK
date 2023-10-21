import XCTest
import iOS_Backend_SDK

@MainActor
final class SignUpTest: XCTestCase {
    func testExample() async throws {
        
        print("SIGNUP")
        
        print("START PROGRAM")
        print("----------------------")
        
        let config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "en", errors: [BackendError(type: .APIConnectionError, localizedDescription: "No API Connection")])
        
        print(config.baseUrl)
        
        Backend.shared.config = config
        
        
        await Backend.shared.signUp(name: "Minko", email: "gamersend77@gmail.com", password: "123Prudni@", confirmPassword: "123Prudni@") { status in
            switch status {
            case .success(let response):
                print(response.message)
            case .failure(let error):
                print(error)
            }
        }
        
        
        print("----------------------")
        print("END PROGRAM")
    }
}
