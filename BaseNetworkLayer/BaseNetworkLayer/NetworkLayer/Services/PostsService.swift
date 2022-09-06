//
//  PostsService.swift
//  BaseNetworkLayer
//
//  Created by Григорий Виняр on 06/09/2022.
//

import Foundation

protocol PostsServiceable {
  func getPosts(userId: Int) async -> Result<Post, RequestError>
}

struct PostsService: HTTPClient, PostsServiceable {
  
  func getPosts(userId: Int) async -> Result<Post, RequestError> {
    return await sendRequest(endpoint: PostsEndpoint.listOfPosts(userId: userId), responseModel: Post.self)
  }
  
}
