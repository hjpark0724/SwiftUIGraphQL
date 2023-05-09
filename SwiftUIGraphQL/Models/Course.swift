//
//  Course.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation


struct Course: Identifiable, Decodable {
    typealias CouresResult = GraphQL.CourseQuery.Data.CourseCollection.Course
    let id: String
    let publishedAt: String
    let title: String
    let subtitle: String
    let numberOfSections: Int
    let numberOfHours: Int
    let subject: String
    let colors: [String?]
    let illustration: String
    let sections: [Section]
    init(_ course: CouresResult?) {
        self.id = course?.sys.id ?? ""
        self.publishedAt = course?.sys.publishedAt ?? ""
        self.title = course?.title ?? ""
        self.subtitle = course?.subtitle ?? ""
        self.subject = course?.subject ?? ""
        self.numberOfSections = course?.numberOfSections ?? 0
        self.numberOfHours = course?.numberOfHours ?? 0
        self.colors = course?.colors ?? ["#0279ff", "#4fa3ff"]
        self.illustration = course?.illustration?.url ?? ""
        self.sections = course?.sectionCollection?.sections.map { Section($0) } ?? []
    }
}
