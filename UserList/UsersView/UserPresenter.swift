//
//  UserPresenter.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation
import Combine

protocol UserPresenterProtocol: ObservableObject {
    var isLoading: Bool {set get }
    var userList: [UserEntity] { get set }
    var showErrors: String? {get set}
    func fetchUserData() async
}

final class UserPresenter: UserPresenterProtocol {
    @Published var isLoading: Bool
    @Published var showErrors: String?
    @Published var userList: [UserEntity] = []
    let interactor: UserInteractorProtocol
    let router: UserRouterProtocol
    
    init(interactor: UserInteractorProtocol,
         router: UserRouterProtocol = Router(), isLoading: Bool = false) {
        self.interactor = interactor
        self.router = router
        self.isLoading = isLoading
    }
    @MainActor
    func fetchUserData() async {
        isLoading = true
        defer {isLoading = false }
        do {
            let users = try await interactor.fetchUserData()
            userList = users
        } catch {
            showErrors = error.localizedDescription
        }
    }
}
