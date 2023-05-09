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
    let spaceId = "renyin2nv6qi"
    let accessToken = "j0AWnyuwcV6s_CqqSjIyoMIL_F1VKDAMZq4AHhKxm1Q"
    private(set) lazy var apollo = ApolloClient(url: URL(string: "https://graphql.contentful.com/content/v1/spaces/\(spaceId)?access_token=\(accessToken)")!)
}
