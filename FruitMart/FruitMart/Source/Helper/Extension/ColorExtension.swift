//
//  ColorExtension.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/02.
//

import SwiftUI
extension Color {
  static let peach = Color("peach") // 앱에서 사용할 메인색
  static let primaryShadow = Color.primary.opacity(0.2) // 그림자에 사용할 색
  static let secondaryText = Color(hex: "#6e6e6e")  // Color.secondary 를 대신해 사용할 조금 더 진한 회색
  static let background = Color(.systemGray6)   // 라이트모드: 연한회색, 다크모드: 검은색
}

extension Color {
  init(hex: String) {
    let scanner = Scanner(string: hex)  //문자열 파서 역할
    _ = scanner.scanString("#") // scanString 은 iOS 13 부터지원
    
    var rgb: UInt64 = 0
    scanner.scanHexInt64(&rgb)  // 문자열 Int64 타입을 변환해 rgb 변수에 저장, 변환할 수 없으면 0 반환
    let r = Double((rgb >> 16) & 0xFF) / 255.0  // 좌측 문자열 2개 추출
    let g = Double((rgb >> 8) & 0xFF) / 255.0   // 중간 문자열 2개 추출
    let b = Double((rgb >> 0) & 0xFF) / 255.0   // 우측 문자열 2개 추출
    self.init(red: r, green: g, blue: b)
  }
}
