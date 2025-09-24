//
//  UserPresenter.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation
import Combine


protocol UserPresenterProtocol: AnyObject {
    var isLoading: Bool {set get }
    var userList: [UserEntity] { get set }
    var showErrors: String? {get set}
    func fetchUserData() async
}

@Observable
final class UserPresenter: UserPresenterProtocol {
    var isLoading: Bool
    var showErrors: String?
    var userList: [UserEntity] = []
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
        defer {isLoading = false}
        do {
            userList = try await interactor.fetchUserData()
        } catch {
            showErrors = error.localizedDescription
        }
    }
}
