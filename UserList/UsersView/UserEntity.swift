//
//  UserEntity.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

struct UserEntity: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
