//
//  GeometryReaderTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/04.
//

import SwiftUI

struct GeometryReaderTest: View {
  var body: some View {
    // page 189 GeometryReader
    //    GeometryReader { _ in
    //      Circle().fill(Color.purple)
    //        .frame(width: 200, height: 200, alignment: .center)
    //        .overlay(Text("Center").font(.title))
    //    }.background(Color.gray)
    //
    //    GeometryReader { _ in
    //      Circle().fill(Color.blue)
    //        .frame(width: 350, height: 350, alignment: .center)
    //      Circle().fill(Color.orange)
    //        .frame(width: 280, height: 280, alignment: .center)
    //      Circle().fill(Color.purple)
    //        .frame(width: 200, height: 200, alignment: .center)
    //      Text("TopLeading").font(.title)
    //    }.background(Color.gray)
    
    //page 192  Size, SafeAcreaInsets
    //    GeometryReader { geometry in
    //      Text("Geometry Reader")
    //        .font(.largeTitle).bold()
    //      // position 은 뷰의 센터 위치를 지정하는 수식어
    //        .position(x: geometry.size.width / 2, y: geometry.safeAreaInsets.top)
    //
    //      VStack {
    //        Text("Size").bold()
    //        // 지오메트리 리더 너비 표시
    //        Text("Width : \(Int(geometry.size.width))")
    //        // 지오메트리 리더 높이 표시
    //        Text("Height : \(Int(geometry.size.height))")
    //      }.position(x: geometry.size.width / 2, y: geometry.size.height / 2.5)
    //
    //      VStack {
    //        Text("SafeAreaInsets").bold()
    //        // 상단 안전 영역의 크기
    //        Text("Top : \(Int(geometry.safeAreaInsets.top))")
    //        // 하단 안전 영역의 크기
    //        Text("Bottom : \(Int(geometry.safeAreaInsets.bottom))")
    //      }.position(x: geometry.size.width / 2, y: geometry.size.height / 1.4)
    //    }.font(.title)
    //    .frame(height: 500)
    //    .border(Color.green, width: 5)
    
    // page 194 Frame
    
    HStack {
      Rectangle().fill(Color.yellow).frame(width: 30, height: nil, alignment: .center)
      VStack {
        Rectangle().fill(Color.blue).frame(width: nil, height: 200, alignment: .center)
        // 레이아웃을 위한 실제 뷰 분리
        GeometryReader {
          self.contents(geometry: $0)
        }.background(Color.green)
        .border(Color.red, width: 4)
      }.coordinateSpace(name: "VStackCS")
    }.coordinateSpace(name: "HStackCS")
    
  }
  
  func contents(geometry g: GeometryProxy) -> some View {
    VStack {
      // local 은 지오메트리 자기 자신에 대한 bounds 값을 반환
      Text("Local").bold()
      Text(stringFormat(for: g.frame(in: .local).origin))
        .padding(.bottom)
      // global 은 윈도우의 bounds 를 기준으로 한 좌표 정보를 반환
      Text("Global").bold()
      Text(stringFormat(for: g.frame(in: .global).origin))
        .padding(.bottom)
      // named 는 지정한 뷰의 원점을 기준으로 한 상대적인 좌표를 구함.
      // VStack 원점으로 부터의 상대거리 계산
      Text("Named VStackCs").bold()
      Text(stringFormat(for: g.frame(in: .named("VStackCS")).origin))
        .padding(.bottom)
      // HStack 원점으로 부터의 상대거리 계산
      Text("Named HStackCs").bold()
      Text(stringFormat(for: g.frame(in: .named("HStackCS")).origin))
        .padding(.bottom)
    }
  }
  
  func stringFormat(for point: CGPoint) -> String {
    String(format: "(x: %.f, y: %.f)", arguments: [point.x, point.y])
  }
  
  enum CoordinateSpace {
    case global
    case local
    case named(AnyHashable)
  }
}

struct GeometryReaderTest_Previews: PreviewProvider {
  static var previews: some View {
    GeometryReaderTest()
  }
}
