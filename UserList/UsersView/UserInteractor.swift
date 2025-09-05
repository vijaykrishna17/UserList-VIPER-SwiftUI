//
//  UserInteractor.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation


protocol UserInteractorProtocol: AnyObject {
    func fetchUserData() async throws -> [UserEntity]
}


final class UserInteractor: UserInteractorProtocol  {
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func fetchUserData() async throws -> [UserEntity] {
          return try await networkService.fetchUserData()
    }
}
