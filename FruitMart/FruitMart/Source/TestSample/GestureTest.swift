//
//  GestureTest'.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/15.
//

import SwiftUI

struct GestureTest: View {
  @State private var longPress = ""
  @State private var tap = ""
  
  var body: some View {
    let longPressGesture = LongPressGesture()
      .onChanged { _ in
        longPress = "LongPress began!"
//        print("LongPress began!")
      }
      .onEnded { _ in
        longPress = "LongPressed!"
//        print("LongPressed!")
      }
    let tapGesture = TapGesture().onEnded {
      tap = "Tapped!"
//      print("Tapped!")
    }
    return VStack {
      Text("Long Press Text is \(longPress)")
      Text("Tap Text is \(tap)")
      Button(action: {
        longPress = ""
        tap = ""
      }, label: {
        Text("초기화")
      })
      Circle()
        .gesture(longPressGesture)
    }
//    .simultaneousGesture(tapGesture, including: .all) // 기본값. 모든 제스처 인식
    .simultaneousGesture(tapGesture, including: .subviews)  // 자식뷰 제스처만 인식함. longPress 만 인식
//    .simultaneousGesture(tapGesture, including: .none)  // 모든 제스처 무시
  }
}

struct GestureTest_Previews: PreviewProvider {
  static var previews: some View {
    GestureTest()
  }
}
