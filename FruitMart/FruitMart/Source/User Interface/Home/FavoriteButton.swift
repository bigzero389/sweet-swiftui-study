//
//  FavoriteButton.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/07.
//

import SwiftUI

struct FavoriteButton: View {
  @EnvironmentObject private var store: Store
  let product: Product
  
//  private var imageName: String {
//      // 즐겨찾기 여부에 따라 이미지 변경
//  }
  
  var body: some View {
    Button(action: {
      self.store.toggleFavorite(of: self.product)
    }) {
      Image(systemName: product.isFavorite ? "heart.fill" : "heart")
        .imageScale(.large)
        .foregroundColor(.peach)
        .frame(width: 32, height: 32, alignment: .center)
        .onTapGesture {
          self.store.toggleFavorite(of: self.product)
        }
    }
  }
}

struct FavoriteButton_Previews: PreviewProvider {
  static var previews: some View {
    FavoriteButton(product: productSamples[0]).environmentObject(Store())
  }
}
