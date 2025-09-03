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

class UserInteractor: UserInteractorProtocol  {
    
    let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    func fetchUserData() async throws -> [UserEntity] {
        do{
          return try await networkService.fetchUserData()
        } catch {
            throw CustomError.decodeingError(error.localizedDescription)
        }
    }
}
