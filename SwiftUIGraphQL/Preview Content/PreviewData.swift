//
//  PreviewData.swift
//  SwiftUIGraphQL
//
//  Created by HYEONJUN PARK on 2023/05/09.
//


import Foundation

var coursePreviewData: Course = load("Course.json")
var courseListPreviewData = Array(repeating: coursePreviewData, count: 5)
