//
//  NewsFeed.swift
//  PosterAssignment
//
//  Created by BELDIN Yaroslav on 10.04.2025.
//

import SwiftUI

struct NewsFeed: View {
    private let service = Service()

    @State private var digests = [Digest]()
    @State private var news = [News]()

    @State private var isLoading = true
    @State private var isRefreshing = false

    var body: some View {
        Group {
            if isLoading {
                loadingView
            } else {
                newsFeed
            }
        }
        .navigationTitle(Constants.navigationTitle)
        .task {
            if digests.isEmpty || news.isEmpty {
                await load()
            }
        }
    }
}

private extension NewsFeed {
    var loadingView: some View {
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .gray))
            .scaleEffect(Constants.LoadingView.scaleEffect)
            .frame(maxHeight: .infinity)
    }

    var newsFeed: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: Constants.NewsFeed.verticalSpacing) {
                ScrollView(.horizontal, showsIndicators: false) {
                    LazyHStack(spacing: Constants.NewsFeed.horizontalSpacing) {
                        ForEach(digests) { digest in
                            DigestCard(digest: digest, isRefreshing: $isRefreshing)
                        }
                    }
                    .padding(.vertical, Constants.NewsFeed.verticalPadding)
                    .padding(.horizontal, Constants.NewsFeed.horizontalPadding)
                }
                VStack(spacing: Constants.NewsFeed.cardSpacing) {
                    ForEach(news) { newsItem in
                        NewsCard(news: newsItem, isRefreshing: $isRefreshing)
                    }
                }
                .padding(.horizontal, Constants.NewsFeed.horizontalPadding)
            }
        }
        .refreshable {
            await refresh()
        }
    }

    func load() async {
        isLoading = true
        defer { isLoading = false }

        async let digests = service.loadDigests()
        async let news = service.loadNews()
        (self.digests, self.news) = await (digests, news)
    }

    func refresh() async {
        isRefreshing = true
        defer { isRefreshing = false }

        async let digests = service.loadDigests()
        async let news = service.loadNews()
        (self.digests, self.news) = await (digests, news)
    }
}

private extension NewsFeed {
    enum Constants {
        static let navigationTitle = "Новости"

        enum LoadingView {
            static let scaleEffect: CGFloat = 1.5
        }

        enum NewsFeed {
            static let verticalSpacing: CGFloat = 8
            static let horizontalSpacing: CGFloat = 16
            static let cardSpacing: CGFloat = 16
            static let horizontalPadding: CGFloat = 16
            static let verticalPadding: CGFloat = 8
        }
    }
}

#Preview {
    NavigationView {
        NewsFeed()
    }
}
