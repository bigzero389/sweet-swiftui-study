//
//  MyStackTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct MyStackTest: View {
  var body: some View {
    MyVStack {
      Color.blue.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 20, alignment: .center)
      Text("Hello, SwiftUI").font(.title).foregroundColor(.red)
      Rectangle().frame(width: 250, height: 40, alignment: .center)
    }
  }
}


struct MyStackTest_Previews: PreviewProvider {
  static var previews: some View {
    Group {
      MyStackTest()
        .environment(\.colorScheme, .dark)
      MyStackTest()
        .environment(\.colorScheme, .light)
    }
//      .previewDevice(PreviewDevice(rawValue: "iPhone 8"))
  }
}

struct MyVStack<Content: View>: View {
  let content: Content
  init(@ViewBuilder content: () -> Content) {
    self.content = content()
  }
  var body: some View {
    VStack(alignment: .leading, spacing: 5) {
      content
    }
  }
}
