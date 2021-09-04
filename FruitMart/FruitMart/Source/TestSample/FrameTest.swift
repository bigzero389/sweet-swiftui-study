//
//  FrameTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI
  // page 197 프레임 수식어
struct FrameTest: View {
    var body: some View {
      //
//      HStack {
//        Text("Frame").background(Color.yellow)
//          .frame(width: 100, height: 100, alignment: .leading)
//          .border(Color.red)
//
//        Text("Frame").background(Color.yellow)
//          .frame(width: 100, height: 100, alignment: .center)
//          .border(Color.red)
//
//        Text("Frame").background(Color.yellow)
//          .frame(width: 100, height: 100, alignment: .trailing)
//          .border(Color.red)
//      }
      
      // page 202 Ideal Size ,fixedSize
      // fixedSize 미적용
      // 텍스트는 실제 문자열 보다 너비가 작아 뒷부분이 생략된 모습, 다른 것들은 주어진 공간에서 최대크기
//      VStack {
//        Text("Frame Modifier").font(.title).bold().frame(width: 80, height: 30)
//        Rectangle()
//        Color.red
//        Image("launchScreen").resizable()
//      }
      
      // fixedSize 적용
      // 고유의 크기로 나옴.
//      VStack {
//        Text("Frame Modifier").font(.title).bold()
//          .fixedSize()  // frame 앞에 있어야 글자가 fix 됨
//          .frame(width: 80, height: 30)
//        Rectangle().fixedSize()
//        Color.red.fixedSize()
//        Image("launchScreen").resizable().fixedSize()
//      }
      
      // page 204
//      VStack(alignment: .center, spacing: 100) {
//        Group {
//          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.")
//          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.")
//            .fixedSize(horizontal: true, vertical: false)
//          Text("FixedSize를 적용하면 글자가 생략되지 않습니다.")
//            .fixedSize(horizontal: false, vertical: true)
//        }.font(.title)
//        .frame(width: 150, height: 40, alignment: .center)
//      }
      
      // page 206 Layout Priority
      VStack(spacing: 20) {
        // 우선순위 미적용
        HStack {
          Color.red
          Color.green
          Color.blue
        }.frame(height: 40)
        
        // 우선순위 변경 - red / blud 가 우선순위 있으므로 green 이 공간할당이 안된다.
        HStack {
          Color.red.layoutPriority(1)
          Color.green
          Color.blue.layoutPriority(1)
        }.frame(height: 40)
        
        // min, max 조건 설정 - green 최소넓이 적용됨. blue 는 최대넓이 제약적용
        HStack {
          Color.red.layoutPriority(1)
          Color.green.frame(minWidth: 30)
          Color.blue.frame(maxWidth: 50).layoutPriority(1)
        }.frame(height: 40)
        
        // 고정크기 frame - 고정크기 Frame 설정시 우선순위와 상관없이 그 크기를 가짐
        HStack {
          Color.red.frame(width: 50)
          Color.green.layoutPriority(1)
          Color.blue.frame(maxWidth: 50).layoutPriority(1)
        }.frame(height: 40)
      }
    }
}

struct FrameTest_Previews: PreviewProvider {
    static var previews: some View {
        FrameTest()
    }
}
