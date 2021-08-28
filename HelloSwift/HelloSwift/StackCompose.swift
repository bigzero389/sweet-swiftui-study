//
//  StackCompose.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/28.
//

import SwiftUI

struct StackComposeView : View {
    var body: some View {
        VStack (alignment: .center, spacing: nil) {
            Text("도형만들기").font(.largeTitle).fontWeight(.heavy)
            HStack {
                Text("둥근모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                HStack {
                    Circle().fill(Color.yellow)
                    Ellipse().fill(Color.green)
                    Capsule().fill(Color.orange)
                    RoundedRectangle(cornerRadius: 30).fill(Color.gray)
                }
            }
            HStack {
                Text("각진모양").font(.title)
                Spacer()
            }
            ZStack {
                Rectangle().frame(height: 10)
                HStack {
                    Color.red
                    Rectangle().fill(Color.blue)
                    RoundedRectangle(cornerRadius: 0).fill(Color.purple)
                }
            }
        }.padding()
        
    }
}

struct StackComposeView_Preview : PreviewProvider {
    static var previews: some View {
        StackComposeView()
    }
}
