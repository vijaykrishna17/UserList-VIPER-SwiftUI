//
//  DetailsVIew.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import SwiftUI

struct DetailsView: View {
    @StateObject var presenter: UserDetailsPresenter
    var body: some View {
        ZStack {
            VStack() {
                Text("User Details")
                    .font(.title)
                cardView
            }.padding()
                .frame(maxWidth: .infinity, alignment: .center)
                .background(Color.red.opacity(0.2))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red,lineWidth: 2)
                        
                )
                .padding()
        }.navigationTitle("USER DETAILS")
            .task {
                 await presenter.fetchDetails()
            }

    }
}

#Preview {
    let service = NetworkService()
    let interactor = UserDetailsInteractor(service: service)
    let presenter = UserDetailsPresenter(interactor: interactor,userID: 3)
    DetailsView(presenter: presenter)
}


extension DetailsView {
    
    var cardView: some View {
        VStack(alignment: .leading, spacing: 10) {
            Text("Name: \(presenter.userDetails?.name ?? "noooo")")
                .font(.title)
            Text("Email: \(presenter.userDetails?.email ?? "")")
                .font(.headline)
            Text("phone No: \(presenter.userDetails?.phone ?? "")")
                .font(.headline)
        }
    }
}
