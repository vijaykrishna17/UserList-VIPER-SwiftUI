//
//  UserRouter.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import Foundation
import SwiftUI

protocol UserRouterProtocol: AnyObject {
    func gotoDetailsView()
    func createModule() -> AnyView
}


class Router: UserRouterProtocol {
    func gotoDetailsView() {
        print("tapping goto details view....")
    }
    
    func createModule() -> AnyView {
        let service = NetworkService()
        let interactor = UserInteractor(networkService: service)
        let presenter = UserPresenter(interactor: interactor)
        let view = ContentView(viewmodel: presenter)
        return AnyView(view)
    }
}
