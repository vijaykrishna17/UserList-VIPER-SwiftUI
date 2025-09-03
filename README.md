# UserList-VIPER-SwiftUI

📱 UserListApp (VIPER + SwiftUI + SOLID Principles)

This is a sample iOS application showcasing how to build a scalable and testable iOS app using SwiftUI combined with the VIPER architecture pattern while following SOLID principles.

🚀 Features

Fetches and displays user data from JSONPlaceholder.

Implements VIPER modules:

View (SwiftUI) → Displays user list.
Interactor → Handles data fetching logic.
Presenter → Manages UI state, error handling, and loading state.
Entity → Defines User model.
Router → Handles module creation and navigation.

Uses Swift Concurrency (async/await) for networking.
Error handling with user-friendly messages.
Loading state with ProgressView.
Protocol-driven for easy testing and mockability.

🛠 Tech Stack

Language: Swift 5.9+

UI: SwiftUI

Architecture: VIPER + SOLID principles

Networking: URLSession (async/await)
State Management: ObservableObject + @Published
Error Handling: Custom error types + Presenter-driven state

📂 Project Structure
UserListApp/
│
├── Entity/           # UserEntity.swift (data models)
├── Interactor/       # UserInteractor.swift (business logic)
├── Presenter/        # UserPresenter.swift (presentation logic)
├── Router/           # Router.swift (module creation + navigation)
├── Service/          # NetworkService.swift (network layer)
└── View/             # ContentView.swift (SwiftUI views)

🎯 Why This Project?

This project demonstrates:

How to apply VIPER architecture in SwiftUI.
How to write clean, testable, and SOLID-compliant iOS code.
How to structure apps for scalability and maintainability.
How to use Swift’s structured concurrency (async let, await, error handling).

📸 Screenshots
<img width="300" height="700" alt="Simulator Screenshot - iPhone 16 Pro - 2025-09-03 at 16 59 20" src="https://github.com/user-attachments/assets/c801f220-6729-4e63-8f3a-7b9602c795b4" />

🔮 Future Improvements

Add unit tests with mocks for UserInteractorProtocol.
Implement navigation in Router.gotoDetailsView().
Add UI tests using XCUITest.
Integrate with a real API (instead of JSONPlaceholder).
