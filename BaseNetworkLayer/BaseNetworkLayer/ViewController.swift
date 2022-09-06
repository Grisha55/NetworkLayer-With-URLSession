//
//  ViewController.swift
//  BaseNetworkLayer
//
//  Created by Григорий Виняр on 06/09/2022.
//

import UIKit

class ViewController: UIViewController {
  
  private let service = PostsService()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .white
    title = "Posts"
    
    getPosts(userId: 2)
  }
  
  func getPosts(userId: Int) {
    
    Task(priority: .background) {
      let result = await service.getPosts(userId: userId)
      switch result {
      case .success(let postResponse):
        print(postResponse)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

