//
//  Endpoint.swift
//  BaseNetworkLayer
//
//  Created by Григорий Виняр on 06/09/2022.
//

import Foundation

protocol Endpoint {
  var scheme: String { get }
  var host: String { get }
  var path: String { get }
  var method: RequestMethod { get }
  var header: [String : String]? { get }
  var body: [String : String]? { get }
}

extension Endpoint {
  var scheme: String {
    return "https"
  }
  
  var host: String {
    return "jsonplaceholder.typicode.com"
  }
}
