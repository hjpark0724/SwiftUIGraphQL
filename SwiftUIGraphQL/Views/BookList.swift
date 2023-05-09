//
//  BookList.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct BookList: View {
    var books: [Book]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                if books.count > 0 {
                    ForEach(books, id: \.id) { book in
                        BookCard(book: book)
                    }
                } else {
                    ForEach(0..<4, id: \.self) { _ in
                        BookCard(book: bookPreviewData)
                            .redacted(reason: .placeholder)
                    }
                }
            }.padding(.horizontal, 20)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct BookList_Previews: PreviewProvider {
    static var previews: some View {
        BookList(books: [bookPreviewData, bookPreviewData])
    }
}
