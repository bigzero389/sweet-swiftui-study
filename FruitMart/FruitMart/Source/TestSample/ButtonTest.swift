//
//  ButtonTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI

struct ButtonTest: View {
  var body: some View {
    VStack(alignment: .center, spacing: 10, content: {
      HStack(spacing: 20) {
        Button("Button") {
          print("Button1")
        }
        
        Button(action: {
          print("Button2")
        }, label: {
          /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/  // 텍스트를 올리고 버튼 외곽에 외곽선을 그려준다.
            .padding()
            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
        })
        
        Button(action: {
          print("Button3")
        }, label: {
          Circle()  // 외곽선을 그리고 텍스트를 올려준다.
            .stroke(lineWidth: 2)
            .frame(width: 80, height: 80, alignment: .center)
            .overlay(Text("Button"))
        }).accentColor(.green)
        
      }
      
      HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: 10, content: {
        Button(action: {
          print("Button4")
        }, label: {
          Image("launchScreen")
            .resizable()
            .frame(width: 120, height: 120, alignment: .center)
        })
        
        Button(action: {
          print("Button5")
        }, label: {
          Image(systemName: "play.circle")
            .imageScale(.large)
            .font(.largeTitle)
        })
        .overlay(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=Overlay Content@*/Text("Placeholder")/*@END_MENU_TOKEN@*/)
      })
      
      VStack(alignment: .center, spacing: 10, content: {
        Button("DefaultButtonStyle") {}
          .buttonStyle(DefaultButtonStyle())
        Button("BorderlessButtonStyle") {}
          .buttonStyle(BorderlessButtonStyle())
        Button("PlainButtonStyle") {}
          .buttonStyle(PlainButtonStyle())
      })
    })
  }
}

//struct Button<Label>: View where Label: View {}

struct ButtonTest_Previews: PreviewProvider {
  static var previews: some View {
    ButtonTest()
  }
}
