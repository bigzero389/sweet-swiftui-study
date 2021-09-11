//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct ProductDetailView: View {
  @State private var quantity: Int = 1
  @State private var showingAlert: Bool = false
  @State private var showingPopup: Bool = false
  @EnvironmentObject private var store: Store
  let product: Product
  
  var body: some View {
    VStack(spacing: 0) {
      productImage
      orderView
    }
    // 팝업 크기 지정 및 dimmed 스타일 적용
//    .modifier(Popup(size: CGSize(width: 200, height: 200), style: .dimmed, message: Text("팝업")))
    .edgesIgnoringSafeArea(.top)
    .alert(isPresented: $showingAlert) { confirmAlert }
    // blur 스타일 적용
    .popup(isPresented: $showingPopup) { OrderCompletedMessage() }
  }
  
  var productImage: some View {
    GeometryReader { _ in
//      Image(self.product.imageName).resizable().scaledToFill()
      ResizedImage(self.product.imageName)
    }
  }
  
  var orderView: some View {
    GeometryReader {
      VStack(alignment: .leading) {
        self.productDescription
        Spacer()
        self.priceInfo
        self.placeOrderButton
      }.frame(height: $0.size.height + 10)
      .padding(15)
      .background(Color.white)  // 다크모드에서도 흰색배경을 사용하기 위해 white 지정
      .cornerRadius(30)
      .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0.0, y: -5)
    }
  }
  
  var productDescription: some View {
    VStack(alignment: .leading, spacing: 16) {
      HStack {
        Text(product.name)
          .font(.largeTitle).fontWeight(.medium)
          .foregroundColor(.black)
        Spacer()
        FavoriteButton(product: product)
      }
      Text(splitText(product.description))
        .foregroundColor(.secondaryText)
        .fixedSize()
      
    }
  }
  
  func splitText(_ text: String) -> String {
    guard !text.isEmpty else { return text }
    let centerIdx = text.index(text.startIndex, offsetBy: text.count / 2)
    let centerSpaceIdx = text[..<centerIdx].lastIndex(of: " ")
      ?? text[centerIdx...].firstIndex(of: " ")
      ?? text.index(before: text.endIndex)
    let afterSpaceIdx = text.index(after: centerSpaceIdx)
    let lhsString = text[..<afterSpaceIdx].trimmingCharacters(in: .whitespaces)
    let rhsString = text[afterSpaceIdx...].trimmingCharacters(in: .whitespaces)
    return String(lhsString + "\n" + rhsString)
  }
  
  var priceInfo: some View {
    /*통화 기호는 작게, 가격은 크게 표시*/
    let price = quantity * product.price
    return HStack {
      (Text("₩ ") + Text("\(price)").font(.title)).fontWeight(.medium)
      Spacer()
      QuantitySelector(quantity: $quantity)
      // 수량 선택 버튼이 들어갈 위치 - 챕터 5에서 구현
    }.foregroundColor(.black)
  }
  
  var placeOrderButton: some View {
    Button(action: {
      self.showingAlert = true
    }) {
      Capsule()
        .fill(Color.peach)
        // 너비는 주어진 공간을 최대로 사용하고 높이는 최소, 최대치 지정
        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
        .overlay(Text("주문하기").font(.system(size: 20)).fontWeight(.medium).foregroundColor(Color.white))
        .padding(30)
    }
    .buttonStyle(ShrinkButtonStyle())
  }
  
  var confirmAlert: Alert {
    Alert(
      title: Text("주문확인"),
      message: Text("\(product.name)을(를) \(quantity)개 구매하겠습니까?"),
      primaryButton: .default(Text("확인"), action: {
        // 주문 기능 구현
        self.placeOrder()
      }),
      secondaryButton: .cancel(Text("취소"))
    )
  }
  
  func placeOrder() {
    store.placeOrder(product: product, quantity: quantity)
    showingPopup = true
  }
}


struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    let source1 = ProductDetailView(product: productSamples[0])
    let source2 = ProductDetailView(product: productSamples[1])
    return Group {
      Preview(source: source2)
//      Preview(source: source2)
//      Preview(source: source1, devices: [.iPhone11], displayDarkMode: false)
//      Preview(source: source2, devices: [.iPhone11Pro], displayDarkMode: false)
    }
  }
}
