//
//  CourseList.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct CourseList: View {
    var courses: [Course] = []
    var body: some View {
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120, maximum: 240), spacing: 16)], spacing: 16) {
            if courses.count > 0 {
                ForEach(courses, id: \.id) { course in
                    CourseCard(course: course)
                }
            } else {
                ForEach(0..<4, id: \.self) { _ in
                    CourseCard(course: coursePreviewData)
                        .redacted(reason: .placeholder)
                }
            }
        }
        .padding(.horizontal, 20)
        .padding(.bottom, 20)
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}
