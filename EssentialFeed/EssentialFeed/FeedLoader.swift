//
//  FeedLoader.swift
//  EssentialFeed
//
//  Created by Vitandrea Sorino on 11/08/25.
//

import Foundation

enum LoadFeedResult {
    case success([FeedItem])
    case error(Error)
}

protocol FeedLoader {
    func loadFeed(completion: @escaping (LoadFeedResult) -> Void)
}
