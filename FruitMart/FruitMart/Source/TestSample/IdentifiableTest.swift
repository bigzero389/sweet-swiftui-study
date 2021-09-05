//
//  IdentifiableTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct Animal: Identifiable {
  let id: Int
  let name: String
  let age: Int
}

struct IdentifiableTest: View {
  let 🐶 = Animal(id: 1, name: "토리", age: 5)
  let 🐱 = Animal(id: 2, name: "릴리", age: 2)
//  let 🐱 = Animal(id: 1, name: "릴리", age: 2)
  
  var body: some View {
    VStack {
      ForEach([🐶, 🐱]) { animal in
        Text(String(describing: animal))
          .font(.title)
          .padding()
      }
    }
  }
}

struct IdentifiableTest_Previews: PreviewProvider {
  static var previews: some View {
    IdentifiableTest()
  }
}
//
//var id: ObjectIdentifier {
//  ObjectIdentifier(self)
//}
//
//extension IdentifiableTest where Self: AnyObject {
//  public var id: ObjectIdentifier { get }
//}
