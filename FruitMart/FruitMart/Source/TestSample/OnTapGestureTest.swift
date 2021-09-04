//
//  OnTapGestureTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI

struct OnTapGestureTest: View {
    var body: some View {
      VStack(alignment: .center, spacing: 10, content: {
        // 버튼을 사용하지 않고 onTapGesture 를 사용한 경우
        Image(systemName: "person.circle")
          .imageScale(.large)
          .onTapGesture {
            print("onTapGesture")
          }
        
        Button(action: {
          print("Button")
        }, label: {
          Image(systemName: "person.circle")
            .imageScale(.large)
        })
      })
    }
}

struct OnTapGestureTest_Previews: PreviewProvider {
    static var previews: some View {
        OnTapGestureTest()
    }
}
