//
//  ProductRowswift.swift
//  FruitMart
//
//  Created by bigzero on 2021/08/31.
//

import SwiftUI

struct ProductRow: View {
  let product: Product
  @EnvironmentObject var store: Store
  @Binding var quickOrder: Product?
  @State private var willAppear: Bool = false
  
  var body: some View {
    HStack {
      productImage
      productDescription
    }
    .frame(height: store.appSetting.productRowHeight) // 뷰전체 높이 default 150
    .background(Color.primary.colorInvert())  //colorInvert() 는 View를 리턴한다.
    .cornerRadius(6)
    .shadow(color: Color.primaryShadow, radius: 1, x: 2, y: 2)
    // 뷰 가장자리에만 그림자효과를 넣으려면
    // 1. 뷰의 배경색을 불투명한 색으로 지정
    // 2. 이미 작성한 수식어들의 효과를 먼저 반영
    // 3. 해당뷰에 shadow 수식어를 추가
    .padding(.vertical, 8)
    .opacity(willAppear ? 1 : 0)
    .animation(.easeInOut(duration: 0.4))
    .onAppear { self.willAppear = true }
    .contextMenu { contextMenu }
  }
}

private extension ProductRow {
  var productImage: some View {
//    Image(product.imageName).resizable().scaledToFit()
    ResizedImage(product.imageName)
      .frame(width: 140)
      .clipped()
  }
  
  var productDescription: some View {
    VStack(alignment: .leading) {
      Text(product.name)
        .font(.headline)
        .fontWeight(.medium)
        .padding(.bottom, 6)
      Text(product.description)
        .font(.footnote)
        .foregroundColor(Color.secondaryText)
      Spacer()
      footerView
    }
    .padding([.leading, .bottom], 12)
    .padding([.top, .trailing])
  }
  
  var footerView: some View {
    HStack(spacing: 0) {
      // 가격정보와 버튼
      Text("₩ ").font(.footnote) + Text("\(product.price)").font(.headline)
      Spacer()
      FavoriteButton(product: product)
//      Image(systemName: "cart").foregroundColor(.peach)
      Symbol("cart",scale: .large, color: .peach)
        .frame(width: 32, height: 32, alignment: .center)
        .onTapGesture { self.orderProduct() }
      
    }
  }
  
  func orderProduct() {
    quickOrder = product
    store.placeOrder(product: product, quantity: 1)
  }
  
  var contextMenu: some View {
    VStack {
      Button(action: { self.toggleFavorite() }) {
        Text("Toggle Favorite")
        Symbol(self.product.isFavorite ? " heart.fill" : "heart")
      }
      Button(action: { self.orderProduct() }) {
        Text("Order Product")
        Symbol("cart")
      }
    }
  }
  
  func toggleFavorite() {
    store.toggleFavorite(of: product)
  }
}

// MARK - Preview
struct ProductRow_Previews: PreviewProvider {
    static var previews: some View {
      Group {        
//        ForEach(productSamples) {
//          Preview(source: ProductRow(product: $0, quickOrder: .constant(nil)).environmentObject(Store()))
//        }
        // single sample preview
        Preview(source: ProductRow(product: productSamples[0], quickOrder: .constant(nil)).environmentObject(Store()))
          .preferredColorScheme(.dark)
      }.padding()
      .previewLayout(.sizeThatFits)
    }
}
