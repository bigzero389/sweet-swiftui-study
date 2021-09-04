//
//  NavigationViewTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI

struct NavigationViewTest: View {
  var body: some View {
    // page 163 내비게이션 바 타이틀
//    NavigationView {
//      Image("launchScreen")
//        .navigationBarTitle("내비게이션 타이틀", displayMode: .inline)
//     //          .navigationBarTitle("내비게이션 타이틀", displayMode: .large)
//     }

    // page 164 내비게이션 바 아이템
//    let leadingItem = Button(action: {
//      print("Leading Item tapped")
//    }, label: {
//      Image(systemName: "bell")
//        .imageScale(.large)
//    })
//
//    let trailingItem = Button(action: {
//      print("Trailing")
//    }, label: {
//      Image(systemName: "gear")
//        .imageScale(.large)
//    })
//
//    return NavigationView {
//      Image("launchScreen")
//        .navigationBarItems(leading: leadingItem, trailing: trailingItem)
//        .navigationBarTitle("내이베이션 바 아이템", displayMode: .inline)
//
//    }

    // page 166 내비게이션 링크
//    NavigationView {
//      NavigationLink(destination: Text("Destination")) {
//        Image("launchScreen")
//          .renderingMode(.original)
//      }
//      .navigationBarTitle("내이게이션 링크")
//      .buttonStyle(PlainButtonStyle())
//    }
    
    // page 169 Hidden 수식어
    NavigationView {
      Image("launchScreen")
        .navigationBarTitle("내비게이션 바 히든")
        .navigationBarHidden(true)
    }
  }
}


struct NavigationViewTest_Previews: PreviewProvider {
  static var previews: some View {
    NavigationViewTest()
  }
}
