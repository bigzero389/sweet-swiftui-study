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
  @State private var showingfavoriteImage: Bool = true
  
  var body: some View {
    NavigationView {
      VStack {
        if showFavorite {
          favoriteProducts
        }
        darkerDivider
        productList
      }
    }
    .popupOverContext(item: $quickOrder, style: .blur, content: popupMessage(product:))
  }
  
  var favoriteProducts: some View {
    FavoriteProductScrollView(showingImage: $showingfavoriteImage)
      .padding(.top, 0)
      .padding(.bottom, -20)
  }
  
  var darkerDivider: some View {
    Color.primary
      .opacity(0.3)
      .frame(maxWidth: .infinity, maxHeight: 1)
  }
  
  var productList: some View {
    List {
      ForEach(store.products) { product in
        HStack {
          ProductRow(product: product, quickOrder: self.$quickOrder)
          NavigationLink(destination: ProductDetailView(product: product)) {
            EmptyView()
          }
          .frame(width: 0).hidden()
        }
        .listRowBackground(Color.background)
      }
      .listRowInsets(EdgeInsets())  // list separator 제거 추가. iOS 14
      .background(Color.background)
    }
    .navigationBarTitle(Text("과일마트"), displayMode: .inline)
  }
  
  var showFavorite: Bool {
    !store.products.filter({$0.isFavorite}).isEmpty
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



