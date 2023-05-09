//
//  CourseViewModel.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation
import Apollo

class CourseViewModel: ObservableObject {
    @Published public private(set) var courses: [Course] = []
    func fetch() async {
        do {
            let result = try await queryCourses()
            guard let result = result, let courseCollection = result.data?.courseCollection else {
                return
            }
            DispatchQueue.main.async {
                self.courses = courseCollection.courses.map{ Course($0) }
            }
        } catch {
            print("error: ", error)
        }
    }
    
    private func queryCourses() async throws -> GraphQLResult<GraphQL.CourseQuery.Data>? {
        return await withCheckedContinuation { continuation in
            GraphQLClient.shared.apollo.fetch(query: GraphQL.CourseQuery(locale: "en-US")) { result in
                switch result {
                case .success(let result):
                    continuation.resume(returning: result)
                case .failure(let error):
                    if let error = error as? Never {
                        continuation.resume(throwing: error)
                    }
                }
            }
        }
    }
    
    
}
