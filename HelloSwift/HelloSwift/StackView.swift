//
//  StackView.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/28.
//

import SwiftUI

struct StackView: View {
    var body: some View {
        VStack (alignment: .center, spacing: nil) {    // Stack : HStack, VStack, ZStack
            Text("Stack Sample")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
            HStack(alignment: .top, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/) {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 30, height: 150)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 30, height: 30)
            }
            VStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                Spacer().frame(width: 30, height: 30)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 30, height: 30)
            }
            ZStack {
                Rectangle()
                    .fill(Color.green)
                    .frame(width: 30, height: 30)
                    .offset(x: 10, y: 10)
                Rectangle()
                    .fill(Color.yellow)
                    .frame(width: 30, height: 30)
            }
        }
        Spacer().background(Color.blue)
    }
}

struct StackView_Previews: PreviewProvider {
    static var previews: some View {
        StackView()
    }
}
