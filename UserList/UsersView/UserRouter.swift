//
//  UserRouter.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation
import SwiftUI

protocol UserRouterProtocol: AnyObject {
    func gotoDetailsView(userID: Int) -> AnyView
    func createModule() -> AnyView
}

final class Router: UserRouterProtocol {
    func gotoDetailsView(userID: Int) -> AnyView {
        print("tapping goto details view....\(userID)")
        let service = NetworkService()
        let interactor = UserDetailsInteractor(service: service)
        let presenter = UserDetailsPresenter(interactor: interactor, userID: userID)
        let view = DetailsView(presenter: presenter)
        return AnyView(view)
    }
    
    func createModule() -> AnyView {
        let service = NetworkService()
        let interactor = UserInteractor(networkService: service)
        let presenter = UserPresenter(interactor: interactor)
        let view = ContentView(viewmodel: presenter)
        return AnyView(view)
    }
}
