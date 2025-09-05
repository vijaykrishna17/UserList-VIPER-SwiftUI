//
//  UserListApp.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import SwiftUI
@main
struct UserListApp: App {
    init() {
            // Set environment once here
            Environment.current = .production
        }
    var body: some Scene {
        WindowGroup {
            let root = Router()
            root.createModule()
        }
    }
}
