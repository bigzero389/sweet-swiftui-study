//
//  FavoriteProductScrollView.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/12.
//

import SwiftUI

struct FavoriteProductScrollView: View {
  @EnvironmentObject private var store: Store
  @Binding var showingImage: Bool
  
  var body: some View {
    VStack(alignment: .leading) {
      title
      if showingImage {
        products
      }
    }
    .padding()
    .transition(.slide)
  }
  
  var title: some View {
    HStack(alignment: .top, spacing: 5) {
      Text("즐겨찾는 상품")
        .font(.headline).fontWeight(.medium)
      Symbol("arrowtriangle.up.square")
        .padding(4)
        .rotationEffect(Angle(radians: showingImage ? .pi : 0))
      Spacer()
    }
    .padding(.bottom, 8)
    .onTapGesture { withAnimation { self.showingImage.toggle() } }
  }
  
  var products: some View {
    let favoriteProducts = store.products.filter { $0.isFavorite }
    return ScrollView(.horizontal, showsIndicators: false) {  // 인디케이터 미표시
      HStack(spacing: 0) {
        ForEach(favoriteProducts) { product in
          NavigationLink(destination: ProductDetailView(product: product)) {
            self.eachProduct(product)
          }
        }
      }
    }
    .animation(.spring(dampingFraction: 0.78))
  }
  
  func eachProduct(_ product: Product) -> some View {
    GeometryReader {  // 스크롤뷰내에서 위치정보를 얻도록 지오메트리 리더 사용
      ResizedImage(product.imageName, renderingMode: .original)
        .clipShape(Circle())
        .frame(width: 90, height: 90)
        .scaleEffect(self.scaledValue(from: $0))
    }
    .frame(width: 105, height: 105, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
  }
  
  func scaledValue(from geometry: GeometryProxy) -> CGFloat {
    let xOffset = geometry.frame(in: .global).minX - 16
    let minSize: CGFloat = 0.9
    let maxSize: CGFloat = 1.1
    let delta: CGFloat = maxSize - minSize
    let size = minSize + delta * (1 - xOffset / UIScreen.main.bounds.width)
    return max(min(size, maxSize), minSize)
  }
}


//struct FavoriteProductScrollView_Previews: PreviewProvider {
//  static var previews: some View {
//    FavoriteProductScrollView(showingImage: $showingImage)
//  }
//}
