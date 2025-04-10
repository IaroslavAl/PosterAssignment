//
//  DigestCard.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import SwiftUI

struct DigestCard: View {
    let digest: Digest

    @Binding
    var isRefreshing: Bool

    var body: some View {
        NavigationLink(destination: DigestDetails(digest: digest)) {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Image(digest.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        width: Constants.imageWidth,
                        height: Constants.imageHeight
                    )
                    .clipped()
                    .cornerRadius(Constants.imageCornerRadius)
                Text(digest.title)
                    .font(.headline)
                    .lineLimit(Constants.Text.titleLineLimit)
            }
            .frame(width: Constants.cardWidth)
            .padding(Constants.Padding.card)
            .background(Color(.systemBackground))
            .cornerRadius(Constants.cardCornerRadius)
            .shimmering($isRefreshing)
            .shadow(
                color: Color.black.opacity(Constants.shadowOpacity),
                radius: Constants.shadowRadius,
                x: Constants.shadowXOffset,
                y: Constants.shadowYOffset
            )
        }
        .buttonStyle(.plain)
        .allowsHitTesting(!isRefreshing)
    }
}

private extension DigestCard {
    private enum Constants {
        static let imageWidth: CGFloat = 150
        static let imageHeight: CGFloat = 100
        static let cardWidth: CGFloat = 150
        static let imageCornerRadius: CGFloat = 10
        static let cardCornerRadius: CGFloat = 12
        static let spacing: CGFloat = 8
        static let shadowRadius: CGFloat = 5
        static let shadowOpacity: Double = 0.1
        static let shadowXOffset: CGFloat = 0
        static let shadowYOffset: CGFloat = 2

        enum Text {
            static let titleLineLimit = 2
        }

        enum Padding {
            static let card: CGFloat = 16
        }
    }
}

#Preview {
    if let digest = Mocks.standDigests.first {
        DigestCard(digest: digest, isRefreshing: .constant(false))
    }
}
