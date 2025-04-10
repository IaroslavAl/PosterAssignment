//
//  Service.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import Foundation

struct Service {
    func loadDigests() async -> [Digest] {
        try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return Mocks.standDigests
    }

    func loadNews() async -> [News] {
        try? await Task.sleep(nanoseconds: NSEC_PER_SEC * 2)
        return Mocks.standNews
    }
}
