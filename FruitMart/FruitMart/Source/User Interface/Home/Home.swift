//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
//  let store: Store
  @EnvironmentObject private var store: Store
  @State private var quickOrder: Product?
  
  var body: some View {
    NavigationView {
      List(store.products) { product in
        NavigationLink(destination: ProductDetailView(product: product)) {
          ProductRow(product: product, quickOrder: self.$quickOrder)
        }
      }.navigationBarTitle(Text("과일마트"), displayMode: .inline)
    }
//    .popup(item: $quickOrder, content: popupMessage(product:))
    .popupOverContext(item: $quickOrder, style: .blur, content: popupMessage(product:))
  }
  
  func popupMessage(product: Product) -> some View {
    let name = product.name.split(separator: " ").last! // 맨뒤에 단어만 잘라서 물품명으로 함.
    return VStack {
      Text(name)
        .font(.title).bold().kerning(3)
        .foregroundColor(.peach)
        .padding()
      
      OrderCompletedMessage()
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
//    Home(store: Store())
    Preview(source: Home().environmentObject(Store()))
  }
}



