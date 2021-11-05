//
//  model.swift
//  herconomyApp
//
//  Created by Decagon on 05/11/2021.
//

import UIKit
struct Details: Codable {
  let page: Int
  let results: [Result]
}

struct Result: Codable {
  let poster_path: String
}


