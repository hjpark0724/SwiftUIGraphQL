//
//  CourseCard.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//

import SwiftUI

struct CourseCard: View {
    var course: Course
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: course.illustration)) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: 120, alignment: .center)
            } placeholder: {
                Rectangle()
                    .foregroundColor(.gray.opacity(0.2))
            }
            Spacer()
            Text(course.title)
                .font(.headline)
                .foregroundColor(.white)
                .lineLimit(2)
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text("\(course.numberOfSections) sections")
                .font(.footnote)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
        .padding(16)
        .frame(height: 210, alignment: .top)
        .background(
            LinearGradient(colors: [Color(hex:  course.colors.first!!), Color(hex: course.colors.last!!)], startPoint: .top, endPoint: .bottomLeading)
        )
        .clipShape(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .stroke(.white.opacity(0.5), lineWidth: 0.5)
                .blendMode(.overlay)
        )
        .shadow(color: .white.opacity(0.3), radius: 16, x: 0, y: 10)
    }
}

struct CourseCard_Previews: PreviewProvider {
    static var previews: some View {
        CourseCard(course: coursePreviewData)
    }
}
