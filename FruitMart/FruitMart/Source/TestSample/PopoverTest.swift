//
//  PopoverTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct PopoverTest: View {
  @State var showingPopover = false
  
  var body: some View {
    VStack {
      Button(action: { self.showingPopover.toggle() }) {
        Text("Popover Button").font(.largeTitle)
      }
    }.popover(
      isPresented: $showingPopover,
      attachmentAnchor: .rect(.bounds), // popover 앵커로 사용할 영역 또는 위치 결정
      arrowEdge: .top,  // popover 의 화살표가 어느 방향을 향할지 결정
      content: popoverContents
    )
  }
  
  func popoverContents() -> some View {
    VStack(alignment: .leading) {
      HStack {
        Button(action: { self.showingPopover = false }) {
          Text("Cancel").foregroundColor(.red)
        }
        Spacer()
        Text("New Event").font(.headline)
        Spacer()
        Button("Add(+)") {}
      }
      Divider().padding(.bottom, 8)
      
      Text("Title")
      TextField("제목", text: .constant(""))
      Text("Contents")
      TextField("내용", text: .constant(""))
      Spacer()
    }.padding()
    
  }
}


struct PopoverTest_Previews: PreviewProvider {
  static var previews: some View {
    PopoverTest()
  }
}
