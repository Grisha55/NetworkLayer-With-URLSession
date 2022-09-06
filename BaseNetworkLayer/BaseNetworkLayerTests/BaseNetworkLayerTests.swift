//
//  BaseNetworkLayerTests.swift
//  BaseNetworkLayerTests
//
//  Created by Григорий Виняр on 06/09/2022.
//

import XCTest
@testable import BaseNetworkLayer

class BaseNetworkLayerTests: XCTestCase {
  
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

  func testPostServiceMock() async {
    let serviceMock = PostsServiceMock()
    let failingResult = await serviceMock.getPosts(userId: 1)
    
    switch failingResult {
    case .success(let post):
      XCTAssertEqual(post.title, "sunt aut facere repellat provident occaecati excepturi optio reprehenderit")
    case .failure:
      XCTFail("The request should not fail")
    }
  }

}
