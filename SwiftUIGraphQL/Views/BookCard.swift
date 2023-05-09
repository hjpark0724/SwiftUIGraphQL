//
//  BookCard.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct BookCard: View {
    let book: Book
    var body: some View {
        VStack(spacing: 8) {
            AsyncImage(url: URL(string: book.cover)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
            }
            Text(book.title)
                .font(.headline)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
            Text(book.subtitle)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 20)
                .foregroundColor(.white)
        }
        .padding(16)
        .frame(width: 252, height: 350, alignment: .top)
        .background(
            LinearGradient(colors: [.blue, .purple], startPoint: .topLeading, endPoint: .bottomTrailing)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white, lineWidth: 0.5)
                .blendMode(.overlay)
        )
        .shadow(color: .white.opacity(0.3), radius: 16, x: 0, y: 10)
    }
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        BookCard(book: bookPreviewData)
    }
}
