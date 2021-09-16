//
//  FruitCard.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/16.
//

import SwiftUI

struct FruitCard: View {
  let imageName: String
  let size: CGSize
  let cornerRadius: CGFloat
  
  init (
    _ imageName: String, // 필수값
    size: CGSize = CGSize(width: 240, height: 200),
    cornerRadius: CGFloat = 14
  ) {
    self.imageName = imageName
    self.size = size
    self.cornerRadius = cornerRadius
  }
  
  var body: some View {
    ResizedImage(imageName)
      .frame(width: size.width, height: size.height, alignment: .center)
      .cornerRadius(cornerRadius)
  }
}

struct FruitCard_Previews: PreviewProvider {
  static var previews: some View {
    FruitCard("launchScreen")
  }
}
