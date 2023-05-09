//
//  ContentView.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    var courses: [Course] = []
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    Text("All Courses")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                    CourseList(courses: courseViewModel.courses)
                }
                .padding()
                .task {
                    await courseViewModel.fetch()
                }
            }
            Color(.white)
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height:0)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
    }
}
