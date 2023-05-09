//
//  ContentView.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var courseViewModel: CourseViewModel
    @EnvironmentObject var bookViewModel: BookViewModel
    var courses: [Course] = []
    var body: some View {
        ZStack(alignment: .top) {
            ScrollView {
                VStack {
                    Text("Books")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    BookList(books: bookViewModel.books)
                    Text("Courses")
                        .font(.title)
                        .bold()
                        .padding(.horizontal, 20)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 40)
                    CourseList(courses: courseViewModel.courses)
                    
                }
                .padding()
        
            }
            Color(.white)
                .animation(.easeIn)
                .ignoresSafeArea()
                .frame(height:0)
        }
        .task {
            await courseViewModel.fetch()
            await bookViewModel.fetch()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(CourseViewModel())
            .environmentObject(BookViewModel())
    }
}
