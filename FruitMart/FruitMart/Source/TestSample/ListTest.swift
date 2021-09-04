//
//  ListTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI

struct ListTest: View {
  var body: some View {
    let fruites = ["사과", "배", "포도", "바나나"]
    let drinks = ["물", "우유", "탄산수"]

    // page 181
//    List {
//      Text("Fruits").font(.largeTitle)
//      ForEach(fruites, id: \.self) {
//        Text($0)
//      }
//      Spacer()
//      Text("Drinks").font(.largeTitle)
//      ForEach(drinks, id: \.self) {
//        Text($0)
//      }
//    }
    
    // page 183 Section
    let titles = ["Fruites", "Drinks"]
    let data = [fruites, drinks]
    return List {
      ForEach(data.indices) { index in
        Section(
          header: Text(titles[index]),
          footer: HStack { Spacer(); Text("\(data[index].count)건") }
        ) {
          ForEach(data[index], id:\.self) {
            Text($0)
          }
        }
      }
    }
    .listStyle(GroupedListStyle())
    
    
    //      List(0..<13) {
    //        Text("\($0)")
    //      }
    //      VStack {
    //        Text("1")
    //        Text("2")
    //        Text("3")
    //        Text("4")
    //        Text("5")
    //        Text("6")
    //        Text("7")
    //        Text("8")
    //        Text("9")
    //        Text("10")
    //      }
  }
}

struct ListTest_Previews: PreviewProvider {
  static var previews: some View {
    ListTest()
  }
}
