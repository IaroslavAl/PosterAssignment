//
//  NewsCard.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//
import SwiftUI

struct NewsCard: View {
    let news: News

    @Binding
    var isRefreshing: Bool

    var body: some View {
        NavigationLink(destination: NewsDetails(news: news)) {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Image(news.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: Constants.imageHeight)
                    .clipped()
                    .cornerRadius(Constants.cornerRadius)
                VStack(alignment: .leading, spacing: Constants.innerSpacing) {
                    Text(news.title)
                        .font(.headline)
                    Text(news.articlePreview)
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                        .lineLimit(Constants.Text.previewLineLimit)
                }
            }
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

private extension NewsCard {
    enum Constants {
        static let spacing: CGFloat = 12
        static let innerSpacing: CGFloat = 8
        static let imageHeight: CGFloat = 180
        static let cornerRadius: CGFloat = 10
        static let cardCornerRadius: CGFloat = 12
        static let shadowRadius: CGFloat = 5
        static let shadowOpacity: Double = 0.1
        static let shadowXOffset: CGFloat = 0
        static let shadowYOffset: CGFloat = 2

        enum Text {
            static let previewLineLimit = 3
        }

        enum Padding {
            static let card: CGFloat = 16
        }
    }
}

#Preview {
    if let news = Mocks.standNews.first {
        NewsCard(news: news, isRefreshing: .constant(false))
    }
}
