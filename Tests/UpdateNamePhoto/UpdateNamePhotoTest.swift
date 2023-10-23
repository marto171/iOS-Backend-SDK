import XCTest
import iOS_Backend_SDK

@MainActor
final class LoginConfirmTest: XCTestCase {
    func testExample() async throws {
        print("START PROGRAM")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        
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
        
        await Backend.shared.updateNamePhoto(name: "Martin Georgiev", image: nil, authToken: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY1MzYyZTA5MmVjZjgzNGQwOTRiZmM3YiIsImlhdCI6MTY5ODA4NTI4MiwiZXhwIjoxNzAzMjY5MjgyfQ.b6JlEijjQ_RzmnxmXnkXB5_b0dHNewJ902t5vC8VizA") { status in
            switch status {
            case .success(let response):
                print(response)
            case .failure(let error):
                print(error)
            }
        }
        
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("------------------UPDATENAMEPHOTO--------------------")
        print("END PROGRAM")
    }
}
