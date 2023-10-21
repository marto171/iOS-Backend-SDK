import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginTest: XCTestCase {
    func testExample() async throws {
        
        print("LOGIN")
        
        print("START PROGRAM")
        print("----------------------")
        
        let config = BackendConfig(baseUrl: "https://api.wellsavor.com", language: "en", errors: [BackendError(type: .APIConnectionError, localizedDescription: "No API Connection")])
        
        Backend.shared.config = config
        
        
        await Backend.shared.login(email: "kokmarok@gmail.com", password: "123Prudni@") { status in
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
