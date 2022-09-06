//
//  Post.swift
//  BaseNetworkLayer
//
//  Created by Григорий Виняр on 06/09/2022.
//

import Foundation

struct Post: Codable {
  let userId: Int
  let id: Int
  let title: String
  let body: String
}
