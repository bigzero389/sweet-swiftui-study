//
//  Popup.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/11.
//

import SwiftUI

enum PopupStyle {
  case none
  case blur
  case dimmed
}

fileprivate struct Popup<Message: View>: ViewModifier {
  let size: CGSize? // 팝업창의 크기
  let style: PopupStyle
  let message: Message
  
  init(
    size: CGSize? = nil,
    style: PopupStyle = .none,
    message: Message
  ) {
    self.size = size
    self.style = style
    self.message = message
  }
  
  func body(content: Content) -> some View {
    content
      .blur(radius: style == .blur ? 2 : 0) // blur 스타일인 경우만 적용
      .overlay(Rectangle().fill(Color.black.opacity(style == .dimmed ? 0.4 : 0)))  // dimmed 스타일인 경우만 적용
      //TODO: 가운데 정렬이 안됨. github 샘플도 가운데 정렬이 안됨. 해결못함. 2021.09.11
      .overlay(popupContent)  // 팝업창으로 표현될 뷰
  }
  
  private var popupContent: some View {
    GeometryReader {
      VStack { self.message }
        .frame(
          width: self.size?.width ?? $0.size.width * 0.6,
          height: self.size?.height ?? $0.size.height * 0.25)
        .background(Color.primary.colorInvert())
        .cornerRadius(12)
        .shadow(color: .primaryShadow, radius: 15, x: 5, y: 5)
        .overlay(self.checkCircleMark, alignment: .top)
    }
  }
  
  private var checkCircleMark: some View {
    Symbol("checkmark.circle.fill", color:.peach)
      .font(Font.system(size: 60).weight(.semibold))
      .background(Color.white.scaleEffect(0.8)) // 체크마크 배경색을 흰색으로 지정
      .offset(x: 0, y: -20)
  }
}

fileprivate struct PopupToggle: ViewModifier {
  @Binding var isPresented: Bool
  func body(content: Content) -> some View {
    content
      .disabled(isPresented)
      .onTapGesture { self.isPresented.toggle() }
  }
}

fileprivate struct PopupItem<Item: Identifiable>: ViewModifier {
  @Binding var item: Item?  // nil이 아니면 팝업 표시
  func body(content: Content) -> some View {
    content
      .disabled(item != nil)
      .onTapGesture { self.item = nil } // 팝업창 제거
  }
}
// MARK: - View Extension

extension View {
  func popupOverContext<Item: Identifiable, Content: View> (
    item: Binding<Item?>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    ignoringEdges edges: Edge.Set = .all,
    @ViewBuilder content: (Item) -> Content
  ) -> some View {
    let isNotNil = item.wrappedValue != nil
    return ZStack {
      self
        .blur(radius: isNotNil && style == .blur ? 2 : 0)
      if isNotNil {
        Color.black
          .luminanceToAlpha() // 휘도를 투명도와 연결해주는 수식어 어두운색에 가까울수록 투명해지고, 밝은색에 가까울수록 검고 불투명해짐
          .popup(item: item, size: size, style: style, content: content)
          .edgesIgnoringSafeArea(edges)
      }
    }
  }
  
  func popup<Content: View>(
    isPresented: Binding<Bool>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    @ViewBuilder content: () -> Content
  ) -> some View {
    if isPresented.wrappedValue {
      let popup = Popup(size: size, style: style, message: content())
      let popupToggle = PopupToggle(isPresented: isPresented)
      let modifiedContent = self.modifier(popup).modifier(popupToggle)
      return AnyView(modifiedContent)
    } else {
      return AnyView(self)
    }
  }
  
  func popup<Content: View, Item: Identifiable>(
    item: Binding<Item?>,
    size: CGSize? = nil,
    style: PopupStyle = .none,
    @ViewBuilder content: (Item) -> Content
  ) -> some View {
    if let selectedItem = item.wrappedValue {
      let content = content(selectedItem)
      let popup = Popup(size: size, style: style, message: content)
      let popupItem = PopupItem(item: item)
      let modifiedContent = self.modifier(popup).modifier(popupItem)
      return AnyView(modifiedContent)
    } else {
      return AnyView(self)
    }
  }
}

