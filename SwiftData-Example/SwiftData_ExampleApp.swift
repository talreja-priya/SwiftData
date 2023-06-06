//
//  SwiftData_ExampleApp.swift
//  SwiftData-Example
//
//  Created by Priya Talreja on 06/06/23.
//

import SwiftUI

@main
struct SwiftData_ExampleApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                UserList()
            }
        }
        .modelContainer(for: [User.self, Company.self])
    }
}
