//
//  Mockable.swift
//  BaseNetworkLayerTests
//
//  Created by Григорий Виняр on 06/09/2022.
//

import Foundation
@testable import BaseNetworkLayer

protocol Mockable: AnyObject {
  var bundle: Bundle { get }
  func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T
}

extension Mockable {
  var bundle: Bundle {
    return Bundle(for: type(of: self))
  }
  
  func loadJSON<T: Decodable>(filename: String, type: T.Type) -> T {
    guard let path = bundle.url(forResource: filename, withExtension: "json") else {
      fatalError("Failed to load JSON")
    }
    
    do {
      let data = try Data(contentsOf: path)
      let decodedObject = try JSONDecoder().decode(type, from: data)
      
      return decodedObject
    }
    catch {
      fatalError("Failed to decode loaded JSON")
    }
  }
}

final class PostsServiceMock: Mockable, PostsServiceable {
  func getPosts(userId: Int) async -> Result<Post, RequestError> {
    return .success(loadJSON(filename: "get_post", type: Post.self))
  }
}
