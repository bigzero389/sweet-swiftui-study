//
//  Symbol.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/11.
//

import SwiftUI

struct Symbol: View {
  let systemName: String
  let imageScale: Image.Scale
  let color: Color?
  
  init(
    _ systemName: String,
    scale imageScale: Image.Scale = .medium,
    color: Color? = nil
  ) {
    self.systemName = systemName
    self.imageScale = imageScale
    self.color = color
  }
  
  var body: some View {
    Image(systemName: systemName)
      .imageScale(imageScale)
      .foregroundColor(color)
  }
}

struct Symbol_Previews: PreviewProvider {
  static var previews: some View {
    Symbol("heart.fill", scale: .large, color: .red)
  }
}
