//
//  BookViewModel.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import Foundation
import Apollo
class BookViewModel: ObservableObject {
    @Published public private(set) var books: [Book] = []
    func fetch() async {
        do {
            let result = try await queryBooks()
            guard let result = result, let bookCollection = result.data?.bookCollection else {
                return
            }
            DispatchQueue.main.async {
                self.books = bookCollection.courses.map { Book($0) }
                self.books.forEach { print($0.cover)}
            }
        } catch {
            print("error: ", error)
        }
    }
    
    private func queryBooks() async throws -> GraphQLResult<GraphQL.BookQuery.Data>? {
        return await withCheckedContinuation { continuation in
            GraphQLClient.shared.apollo.fetch(query: GraphQL.BookQuery()) { result in
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
