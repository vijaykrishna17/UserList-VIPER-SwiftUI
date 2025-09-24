//
//  UserDetailsPresenter.swift
//  UserList
//
//  Created by vijay krishna on 04/09/25.
//

import Foundation
import Combine

protocol UserDetailsPresenterProtocol: ObservableObject {
    var isLoading: Bool {set get}
    var userDetails: UserEntity? {set get}
    var showError: String? {set get}
    var userID: Int {get set}
    func fetchDetails() async
}

final class UserDetailsPresenter: UserDetailsPresenterProtocol {
   var userID: Int
   @Published var userDetails: UserEntity?
   @Published var showError: String?
   @Published var isLoading: Bool
   let interactor: UserDetailsInteractorProtocol
    
    init(interactor: UserDetailsInteractorProtocol,isLoading: Bool = false,userID: Int) {
        self.interactor = interactor
        self.isLoading = isLoading
        self.userID = userID
    }
    
    @MainActor
    func fetchDetails() async  {
        isLoading = true
        defer { isLoading = false }
        do {
            userDetails = try await interactor.fetchDetails(userID: self.userID)
        } catch {
            showError = error.localizedDescription
        }
    }
}
