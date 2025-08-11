//
//  RemoteFeedLoaderTests.swift
//  EssentialFeedTests
//
//  Created by Vitandrea Sorino on 11/08/25.
//

import XCTest

class RemoteFeedLoader {
    func load() {
        HTTPClient.shared.get(from: URL(string: "http://www.google.it")!)
    }
}

class HTTPClient {
    static var shared = HTTPClient()
        
    func get(from url: URL) {}
}

class HTTPClientSpy: HTTPClient {
    override func get(from url: URL) {
        requestedURL = url
    }
    
    var requestedURL: URL?
}

final class RemoteFeedLoaderTests: XCTestCase {

    func test_init_doesNotRequetsDataFromURL() {
        
        //Dependency injection 
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        _ = RemoteFeedLoader()
        
        XCTAssertNil(client.requestedURL)
    }
    
    func test_load_requestDayaFromURL() {
        let client = HTTPClientSpy()
        HTTPClient.shared = client
        let sut = RemoteFeedLoader()
        
        sut.load()
        
        XCTAssertNotNil(client.requestedURL)
    }

}
