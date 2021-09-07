//
//  QuantitySelector.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/07.
//

import SwiftUI

struct QuantitySelector: View {
  @Binding var quantity: Int  // binding 프로퍼티 래퍼
  var range: ClosedRange<Int> = 1...20  // 수량선택범위
  
  var body: some View {
    HStack {
      Button(action: { self.changeQuantity(-1) }) { // 수량감소버튼
        Image(systemName: "minus.circle.fill")
          .imageScale(.large)
          .padding()
      }.foregroundColor(Color.gray.opacity(0.5))
      
      Text("\(quantity)")
        .bold()
        .font(Font.system(.title, design: .monospaced))
        // monospaced 폰트디자인을 적용하면 숫자가 변경하더라도 일관된 크기를 유지한다.
        .frame(minWidth: 40, maxWidth: 60)
      
      Button(action: { self.changeQuantity(+1) }) {
        Image(systemName: "plus.circle.fill")
          .imageScale(.large)
          .padding()
      }.foregroundColor(Color.gray.opacity(0.5))
    }
  }
  
  private func changeQuantity(_ num: Int) {
    // ~= 연산자는 우변의 값이 좌변값에 포함되어 있는지를 판단한다.
    if range ~= quantity + num {
      quantity += num
    }
  }
}

struct QuantitySelector_Previews: PreviewProvider {
//  @State private var quantity = 0
  static var previews: some View {
    Group {
      QuantitySelector(quantity: .constant(1))
      QuantitySelector(quantity: .constant(10))
      QuantitySelector(quantity: .constant(20))
    }.padding()
    .previewLayout(.sizeThatFits)
  }
}
