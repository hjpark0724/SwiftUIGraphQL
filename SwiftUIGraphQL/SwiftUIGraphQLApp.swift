//
//  SwiftUIGraphQLApp.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

@main
struct SwiftUIGraphQLApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(CourseViewModel())
                .environmentObject(BookViewModel())
        }
    }
}
