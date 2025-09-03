//
//  UserPresenter.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation
import Combine

protocol UserPresenterProtocol: ObservableObject {
    var userList: [UserEntity] { get set }
    var showErrors: String? {get set}
    func fetchUserData() async
}

class UserPresenter: UserPresenterProtocol {
    @Published var showErrors: String?
    @Published var userList: [UserEntity] = []
    let interactor: UserInteractorProtocol
    
    init(interactor: UserInteractorProtocol) {
        self.interactor = interactor
    }
    @MainActor
    func fetchUserData() async {
        do {
            let users = try await interactor.fetchUserData()
            userList = users
        } catch {
            showErrors = error.localizedDescription
        }
    }
}
