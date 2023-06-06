//
//  UserList.swift
//  SwiftData-Example
//
//  Created by Priya Talreja on 06/06/23.
//

import SwiftUI
import SwiftData

@Model
class User {
    var id: UUID
    var firstName: String
    var lastName: String
    var company: Company
    
    init(firstName: String, lastName: String, company: Company) {
        self.id = UUID()
        self.firstName = firstName
        self.lastName = lastName
        self.company = company
    }
}

@Model
class Company {
    var id: UUID
    var companyName: String
    var designation: String
    
    init(companyName: String, designation: String) {
        self.id = UUID()
        self.companyName = companyName
        self.designation = designation
    }
}


struct UserList: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \User.firstName, order: .forward, animation: .smooth) var users: [User]
    
    var body: some View {
        VStack {
            if users.isEmpty {
               Text("Press '+' to add new user")
            } else {
                List(users) { user in
                    NavigationLink {
                        EditUser(user: user)
                    } label: {
                        VStack(alignment: .leading) {
                            Text("\(user.firstName) \(user.lastName)")
                                .fontWeight(.bold)
                                .font(.headline)
                            Text("Company: \(user.company.companyName)")
                                .fontWeight(.regular)
                                .font(.caption)
                            Text("Designation: \(user.company.designation)")
                                .fontWeight(.regular)
                                .font(.caption2)
                        }
                        .swipeActions {
                            Button("Delete", role: .destructive) {
                                modelContext.delete(user)
                            }
                        }
                    }
                }
            }
        }
        .toolbar {
            NavigationLink {
                CreateUser()
            } label: {
                Text("+")
                    .fontWeight(.bold)
                    .font(.title)
            }
        }
    }
}


#Preview {
    UserList()
}
