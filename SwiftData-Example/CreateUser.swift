//
//  CreateUser.swift
//  SwiftData-Example
//
//  Created by Priya Talreja on 06/06/23.
//

import SwiftUI

struct CreateUser: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var companyName: String = ""
    @State private var designation: String = ""
    
    var body: some View {
        VStack(spacing: 20) {
            TextField("First Name", text: $firstName)
                .textFieldStyle(.roundedBorder)
            TextField("Last Name", text: $lastName)
                .textFieldStyle(.roundedBorder)
            TextField("Company Name", text: $companyName)
                .textFieldStyle(.roundedBorder)
            TextField("Designation", text: $designation)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }
        .padding(20)
        .navigationTitle("Create User")
        .toolbar {
            Button(action: {
                let user = User(firstName: firstName, lastName: lastName, company: Company(companyName: companyName, designation: designation))
                modelContext.insert(user)
                do {
                    try modelContext.save()
                    presentationMode.wrappedValue.dismiss()
                } catch {
                    print(error.localizedDescription)
                }
            }, label: {
                Text("Save")
            })
        }
    }
}

#Preview {
    CreateUser()
}
