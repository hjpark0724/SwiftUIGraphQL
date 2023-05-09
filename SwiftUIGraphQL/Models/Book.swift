//
//  Book.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation

struct Book : Identifiable, Decodable {
    typealias BookResult = GraphQL.BookQuery.Data.BookCollection.Course
    let id: String
    let publishedAt: String
    let title: String
    let subtitle: String
    let cover: String
    let introduce: String
    init(_ book: BookResult?) {
        self.id = book?.sys.id ?? ""
        self.publishedAt = book?.sys.publishedAt ?? ""
        self.title = book?.title ?? ""
        self.subtitle = book?.subtitle ?? ""
        self.cover = book?.cover?.url ?? ""
        self.introduce = book?.introduce ?? ""
    }
}

