//
//  NewsDetails.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import SwiftUI

struct NewsDetails: View {
    let news: News

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: Constants.spacing) {
                Image(news.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(Constants.cornerRadius)
                Text(news.title)
                    .font(.title)
                    .fontWeight(.bold)
                Text(news.article)
                    .font(.body)
                    .lineSpacing(Constants.lineSpacing)
            }
            .padding(Constants.padding)
        }
    }
}

private extension NewsDetails {
    private enum Constants {
        static let spacing: CGFloat = 20
        static let lineSpacing: CGFloat = 6
        static let cornerRadius: CGFloat = 12
        static let padding: CGFloat = 16
    }
}

#Preview {
    if let news = Mocks.standNews.first {
        NewsDetails(news: news)
    }
}
