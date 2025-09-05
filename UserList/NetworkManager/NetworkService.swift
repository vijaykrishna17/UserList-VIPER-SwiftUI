//
//  NetworkService.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation

enum Environment: String {
    case production
    case development
    case uat
    
    var baseURL: String {
        switch self {
        case .production:
            return "https://jsonplaceholder.typicode.com/"
        case .development:
            return "https://jsonplaceholder.typicode.com/"
        case .uat:
            return "https://jsonplaceholder.typicode.com/"
        }
    }
    
    // Current environment (default: development)
    static var current: Environment = .development
}

enum WebURL {
    case user
    case details(Int)
    
    var url: String {
        switch self {
        case .user:
            return Environment.current.baseURL + "users"
        case .details(let id):
            return Environment.current.baseURL + "users/\(id)"
        }
    }
}

protocol NetwokServiceProtocal: AnyObject {
    func fetchUserData() async throws -> [UserEntity]
    func fetchUserDetails(userID: Int) async throws -> UserEntity
}

class NetworkService: NetwokServiceProtocal {
    private let networkManget: NetworkManaging
    init(networkManget: NetworkManaging = NetworkManager()) {
        self.networkManget = networkManget
    }
    func fetchUserData() async throws -> [UserEntity] {
        return try await networkManget.fetchData(urlEndpoint: .user, type: [UserEntity].self)
    }
    
    func fetchUserDetails(userID: Int) async throws -> UserEntity {
        return try await networkManget.fetchData(urlEndpoint: .details(userID), type: UserEntity.self)
    }
}

