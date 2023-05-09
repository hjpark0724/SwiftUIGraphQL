//
//  GraphQLClient.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation
import Apollo

class GraphQLClient {
    static let shared = GraphQLClient()
    let spaceId: String
    let accessToken: String
    init() {
        let keys: Keys = load("key.json")
        self.spaceId = keys.spaceId
        self.accessToken = keys.accessToken
    }
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/\(spaceId)?access_token=\(accessToken)")!)
}


struct Keys : Decodable {
    let spaceId: String
    let accessToken: String
}
