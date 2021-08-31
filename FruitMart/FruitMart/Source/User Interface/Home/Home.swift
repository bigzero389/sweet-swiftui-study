//
//  Home.swift
//  FruitMart
//
//  Created by Giftbot on 2020/03/02.
//  Copyright © 2020 Giftbot. All rights reserved.
//

import SwiftUI

struct Home: View {
  var body: some View {
    VStack {
      ProductRow()
      ProductRow()
      ProductRow()
    }
  }
}

struct Home_Previews: PreviewProvider {
  static var previews: some View {
    Home()
  }
}

struct ProductRow: View {
  var body: some View {
    HStack {
      productImage
      productDescription
    }
    .frame(height: 150) // 뷰전체 높이 150 지정
    .background(Color.primary.colorInvert())  //colorInvert() 는 View를 리턴한다.
    .cornerRadius(6)
    // 뷰 가장자리에만 그림자효과를 넣으려면
    // 1. 뷰의 배경색을 불투명한 색으로 지정
    // 2. 이미 작성한 수식어들의 효과를 먼저 반영
    // 3. 해당뷰에 shadow 수식어를 추가
    .shadow(color: Color.primary.opacity(0.33), radius: 1, x: 2, y: 2)
    .padding(.vertical, 8)
  }
}
private extension ProductRow {
  var productImage: some View {
    Image("apple")
      .resizable()
      .scaledToFit()
      .frame(width: 140)
      .clipped()
  }
  
  var productDescription: some View {
    VStack(alignment: .leading) {
      Text("백설공주 사과")
        .font(.headline)
        .fontWeight(.medium)
        .padding(.bottom, 6)
      Text("달콤한 맛이 좋은 과일의 여왕 사과. 독은 없고 꿀만 가득해요!")
        .font(.footnote)
        .foregroundColor(.secondary)
      Spacer()
      footerView
    }
    .padding([.leading, .bottom], 12)
    .padding([.top, .trailing])
  }
  
  var footerView: some View {
    HStack(spacing: 0) {
      // 가격정보와 버튼
      Text("₩").font(.footnote) + Text("2100").font(.headline)
      Spacer()
      Image(systemName: "heart")
        .imageScale(.large)
        .foregroundColor(Color("peach"))
        .frame(width: 32, height: 32, alignment: .center)
      Image(systemName: "cart")
        .foregroundColor(Color("peach"))
        .frame(width: 32, height: 32, alignment: .center)
    }
  }
  
}

