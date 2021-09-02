//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
  var body: some View {
    VStack(alignment: .center, spacing: 0) {
      ForEach((1...productSamples.count), id: \.self) {
        ProductRow(product: productSamples[$0-1])
      }
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}



