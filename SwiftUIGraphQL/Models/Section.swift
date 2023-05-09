//
//  Section.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation

struct Section: Identifiable, Decodable {
    let id: String
    let title: String
    let subtitle: String
    let content: String
    
    init(_ section: GraphQL.CourseQuery.Data.CourseCollection.Course.SectionCollection.Section?) {
        self.id = section?.sys.id ?? ""
        self.title = section?.title ?? ""
        self.subtitle = section?.subtitle ?? ""
        self.content = section?.content ?? ""
    }
}
