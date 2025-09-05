//
//  UserDetailsInteractor.swift
//  UserList
//
//  Created by vijay krishna on 04/09/25.
//

import Foundation

protocol UserDetailsInteractorProtocol: AnyObject {
    func fetchDetails(userID: Int) async throws -> UserEntity
}


final class UserDetailsInteractor: UserDetailsInteractorProtocol {
    private let service: NetwokServiceProtocal
    init(service: NetwokServiceProtocal) {
        self.service = service
    }
    
    func fetchDetails(userID: Int) async throws -> UserEntity {
          return  try await service.fetchUserDetails(userID: userID)
    }
}
