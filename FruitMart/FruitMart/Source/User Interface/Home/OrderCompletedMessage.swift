//
//  OrderCompletedMessage.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/11.
//

import SwiftUI

struct OrderCompletedMessage: View {
    var body: some View {
        Text("주문 완료!")
          .font(.system(size: 24))
          .bold()
          .kerning(2) // 자간조정
    }
}

struct OrderCompletedMessage_Previews: PreviewProvider {
    static var previews: some View {
        OrderCompletedMessage()
    }
}
