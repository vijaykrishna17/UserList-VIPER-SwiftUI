//
//  NetworkService.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation

protocol NetwokServiceProtocal: AnyObject {
    func fetchUserData() async throws -> [UserEntity]
}

class NetworkService: NetwokServiceProtocal {
    private let networkManget: NetworkManaging
    init(networkManget: NetworkManaging = NetworkManager()) {
        self.networkManget = networkManget
    }
    func fetchUserData() async throws -> [UserEntity] {
        do {
            return try await networkManget.fetchData(urlEndpoint: "https://jsonplaceholder.typicode.com/users", type: [UserEntity].self)
        }catch {
            throw CustomError.decodeingError(error.localizedDescription)
        }
    }
}

