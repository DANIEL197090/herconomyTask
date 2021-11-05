//
//  model.swift
//  herconomyApp
//
//  Created by Decagon on 05/11/2021.
//

import UIKit
struct Details: Decodable {
  let page: Int
  let result: [Result]
}

struct Result: Decodable{
  let poster_path: String
}


