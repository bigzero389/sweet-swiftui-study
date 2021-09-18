//
//  OrderRow.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/16.
//

import SwiftUI

struct OrderRow: View {
  let order: Order
  var body: some View {
    HStack {
      ResizedImage(order.product.imageName) //상품이미지
        .frame(width: 60, height: 60)
        .clipShape(Circle())
        .padding()
      VStack(alignment: .leading, spacing: 10) {
        Text(order.product.name)  //상품명
          .font(.headline).fontWeight(.medium)
        Text("₩ \(order.price) | \(order.quantity)개")
          .font(.footnote)
          .foregroundColor(.secondary)
      }
    }
    .frame(height: 100)
  }
}

// MARK: - Preview
struct OrderRow_Previews: PreviewProvider {
  static var previews: some View {
    List(productSamples.indices) { index in
      OrderRow(order:
        Order(id: index,
              product: productSamples[index],
              quantity: (1...9).randomElement()!))
    }
  }
}
