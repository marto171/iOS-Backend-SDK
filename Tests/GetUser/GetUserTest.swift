import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginConfirmTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        
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
        
        await Backend.shared.getUser(authToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MzYyZTA5MmVjZjgzNGQwOTRiZmM3YiIsImlhdCI6MTY5ODA4MTkwMCwiZXhwIjoxNzAzMjY1OTAwfQ.t9nKxVqDLhkMSj805xlb0vmOzfc-IMIIVQrFxg_bvX8") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("------------------GETME--------------------")
        print("END PROGRAM")
    }
}
