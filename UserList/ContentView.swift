//
//  ContentView.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewmodel: UserPresenter
    var body: some View {
        ZStack {
            NavigationStack {
                if !viewmodel.isLoading {
                    ScrollView {
                        ForEach(viewmodel.userList) { user in
                            NavigationLink(destination: viewmodel.router.gotoDetailsView(userID: user.id)) {
                                userCellView(user: user)
                            }
                        }
                    }.navigationTitle("USER LIST")
                } else {
                    ProgressView()
                        .frame(width: 500, height: 100)
                }
            }.task {
                await viewmodel.fetchUserData()
            }
        }.ignoresSafeArea()
    }
}

#Preview {
    let service = NetworkService()
    let interractor = UserInteractor(networkService: service)
    let vm = UserPresenter(interactor: interractor)
    ContentView(viewmodel: vm)
}

extension ContentView {
    func userCellView(user: UserEntity) -> some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack(alignment: .center,spacing: 10) {
//                Image(systemName: "globe")
//                    .imageScale(.large)
//                    .foregroundStyle(.tint)
                VStack(alignment: .leading, spacing: 5) {
                    Text(user.name)
                        .foregroundStyle(Color.red)
                        .font(.headline)
                        .fontWeight(.bold)
                    Text(user.email)
                       // .foregroundStyle(Color.blue)
                        .font(.headline)
                }
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.red, lineWidth: 2)
                    .background(RoundedRectangle(cornerRadius: 10).fill(Color.red.opacity(0.1)))
            )
            .padding(.horizontal)
            
        }
    }
}
