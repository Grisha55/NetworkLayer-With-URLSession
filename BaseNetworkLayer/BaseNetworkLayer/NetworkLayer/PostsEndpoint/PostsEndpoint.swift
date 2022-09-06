//
//  PostsEndpoint.swift
//  BaseNetworkLayer
//
//  Created by Григорий Виняр on 06/09/2022.
//

import Foundation

enum PostsEndpoint {
  case listOfPosts(userId: Int)
}

extension PostsEndpoint: Endpoint {
  var path: String {
    switch self {
    case .listOfPosts(let userId):
      return "/posts/\(userId)"
    }
  }
  
  var method: RequestMethod {
    switch self {
    case.listOfPosts:
      return .get
    }
  }
  
  var header: [String : String]? {
    switch self {
    case .listOfPosts:
      return [
        "Content-Type": "application/json"
      ]
    }
  }
  
  var body: [String : String]? {
    switch self {
    case .listOfPosts:
      return nil
    }
  }
}
