//
//  Models.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import Foundation

struct Digest: Identifiable {
    let id: String
    let image: String
    let title: String
    let text: String
}

struct News: Identifiable {
    let id: String
    let title: String
    let articlePreview: String
    let article: String
    let image: String
}
