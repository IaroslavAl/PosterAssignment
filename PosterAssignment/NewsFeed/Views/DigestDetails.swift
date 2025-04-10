//
//  DigestDetails.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import SwiftUI

struct DigestDetails: View {
    let digest: Digest

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Image(digest.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
                Text(digest.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(digest.text)
                    .font(.body)
                    .lineSpacing(Constants.lineSpacing)
            }
            .padding(Constants.padding)
        }
    }
}

private extension DigestDetails {
    private enum Constants {
        static let spacing: CGFloat = 20
        static let lineSpacing: CGFloat = 6
        static let cornerRadius: CGFloat = 12
        static let padding: CGFloat = 16
    }
}

#Preview {
    if let digest = Mocks.standDigests.first {
        NavigationView {
            DigestDetails(digest: digest)
        }
    }
}
