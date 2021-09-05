//
//  Store.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import Foundation

final class Store {
  var products: [Product]
  
  init(filename: String = "ProductData.json") {
    self.products = Bundle.main.decode(filename: filename, as: [Product].self)
  }
}
