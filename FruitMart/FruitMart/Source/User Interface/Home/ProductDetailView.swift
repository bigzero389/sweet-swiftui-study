//
//  ProductDetailView.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct ProductDetailView: View {
  let product: Product
  
  var body: some View {
    VStack(spacing: 0) {
      productImage
      orderView
    }.edgesIgnoringSafeArea(.top)
  }
  
  var productImage: some View {
    GeometryReader { _ in
      Image(self.product.imageName)
        .resizable()
        .scaledToFill()
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
      .padding(32)
      .background(Color.white)  // 다크모드에서도 흰색배경을 사용하기 위해 white 지정
      .cornerRadius(16)
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
        Image(systemName: "heart")  // 즐겨찾기
          .imageScale(.large)
          .foregroundColor(Color.peach)
          .frame(width: 32, height: 32, alignment: .center)
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
    HStack {
      (Text("₩ ") + Text("\(product.price)").font(.title)).fontWeight(.medium)
      Spacer()
      // 수량 선택 버튼이 들어갈 위치 - 챕터 5에서 구현
    }.foregroundColor(.black)
  }
  
  var placeOrderButton: some View {
    Button(action: { }) {
      Capsule()
        .fill(Color.peach)
        // 너비는 주어진 공간을 최대로 사용하고 높이는 최소, 최대치 지정
        .frame(maxWidth: .infinity, minHeight: 30, maxHeight: 55)
        .overlay(Text("주문하기").font(.system(size: 20)).fontWeight(.medium).foregroundColor(Color.white))
        .padding()
    }
  }
}

struct ProductDetailView_Previews: PreviewProvider {
  static var previews: some View {
    ProductDetailView(product: productSamples[0])
  }
}
