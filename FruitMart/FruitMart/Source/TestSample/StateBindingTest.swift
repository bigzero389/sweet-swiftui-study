//
//  StateBindingTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct StateBindingTest: View {
  @State private var isFavorite = true
  @State private var count = 0
  
  var body: some View {
    VStack(alignment: .center, spacing: 10) {
      Toggle(isOn: $isFavorite) {
        Text("isFavorite : \(isFavorite.description)")
      }
      Stepper("Count: \(count)", value: $count)
    }
  }
}

struct StateBindingTest_Previews: PreviewProvider {
  static var previews: some View {
    StateBindingTest()
  }
}
