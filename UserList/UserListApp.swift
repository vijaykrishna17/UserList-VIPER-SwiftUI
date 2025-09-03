//
//  UserListApp.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import SwiftUI

@main
struct UserListApp: App {
    var body: some Scene {
        WindowGroup {
            let root = Router()
            root.createModule()
        }
    }
}
