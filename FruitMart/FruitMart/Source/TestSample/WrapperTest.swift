//
//  WrapperTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/07.
//

import Foundation
import SwiftUI

@propertyWrapper
struct RoundedTo<Value: FloatingPoint> {  // 제네릭 매개변수 사용
  private var value: Value = 0
  private let precision: Int  // 반올림자릿수 지정
  // precision 이 2 일 경우 100, 3 일 경우 1000
  private var multiplier: Value {
    (0..<precision).reduce(1) {
      (sum, _) in sum * 10
    }
  }
  
  init(wrappedValue: Value, _ precision: Int) {
    assert(precision >= 0)
    self.precision = precision
    self.wrappedValue = wrappedValue
  }
  
  var wrappedValue: Value {
    get { value }
    set { value = (newValue * multiplier).rounded() / multiplier }
  }
  
  var projectedValue: Self {
    get { self }
    set { self = newValue }
  }
}

struct Numbers: View {
  @State private var showingAlert = false
  @RoundedTo(2) var roundedNum = 1.2345
  @RoundedTo(wrappedValue: 1.2345, 2) var roundedNum2: Double
  
  var body: some View {
    let numbers = Numbers()
    
    HStack(alignment: .center, spacing: 10) {
      Button(action: {
        self.showingAlert = true
      }, label: {
        Text("Rounded Num Type1")
          .background(RoundedRectangle(cornerRadius: 4).strokeBorder())
      }).alert(isPresented: $showingAlert) {
        Alert(
          title: Text("Rounded Num Type1"),
          message: Text("\(numbers.roundedNum)"),
          primaryButton: .default(Text("확인"), action: { self.showingAlert = false } ),
          secondaryButton: .cancel(Text("취소"))
        )
      }
//      Spacer()
      Button(action: {
        self.showingAlert = true
      }, label: {
        Text("Rounded Num Type2")
          .background(RoundedRectangle(cornerRadius: 4).strokeBorder())
      }).alert(isPresented: $showingAlert) {
        Alert(
          title: Text("Rounded Num Type2"),
          message: Text("\(numbers.roundedNum2)"),
          primaryButton: .default(Text("확인"), action: { self.showingAlert = false } ),
          secondaryButton: .cancel(Text("취소"))
        )
      }
    }
  }
}

struct WrapperTest_Previews: PreviewProvider {
  static var previews: some View {
    Numbers()
  }
}

