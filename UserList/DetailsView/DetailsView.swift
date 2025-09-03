//
//  DetailsVIew.swift
//  UserList
//
//  Created by vijay krishna on 03/09/25.
//

import SwiftUI

struct DetailsView: View {
    var body: some View {
        ZStack {
            VStack() {
                Text("Userdetails")
                    .font(.title)
                
            }.padding()
            .frame(maxHeight: .infinity, alignment: .top)
                .frame(maxWidth: .infinity, alignment: .topLeading)
                .background(Color.red.opacity(0.2))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color.red,lineWidth: 2)
                        
                )
                .padding()
        }.navigationTitle("USER DETAILS")
    }
}

#Preview {
    NavigationStack {
        DetailsView()
    }
}
