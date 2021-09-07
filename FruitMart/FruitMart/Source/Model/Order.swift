//
//  Order.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/07.
//

import Foundation

struct Order: Identifiable {
  static var orderSequence = sequence(first: 1, next: { $0 + 1 })
  
  let id: Int
  let product: Product
  let quantity: Int
  
  var price: Int {
    product.price * quantity
  }
}
