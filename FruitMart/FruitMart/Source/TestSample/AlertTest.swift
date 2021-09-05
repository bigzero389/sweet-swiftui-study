//
//  AlertTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct AlertTest: View {
  @State private var showingAlert = false
  @State private var showingActionSheet = false
  
  var body: some View {
    VStack(alignment: .center){
      Button(action: { self.showingAlert = true }) {
        Text("Alert")
      }.alert(isPresented: $showingAlert) {
        Alert(
          title: Text("제목"),
          message: Text("내용"),
          primaryButton: .default(Text("확인"), action: { self.showingAlert = false } ),
          secondaryButton: .cancel(Text("취소"))
        )
      }
      Spacer().frame(height: 50)
      Button(action: { self.showingActionSheet = true }) {
        /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/
      }.actionSheet(isPresented: $showingActionSheet) {
        ActionSheet (
          title: Text("제목"),
          message: Text("내용"),
          buttons: [
            .default(Text("버튼1")),
            .default(Text("버튼2")),
            .destructive(Text("버튼3")),
            .cancel(Text("취소")),
          ]
        )
      }
      
    }
  }
  
  struct AlertTest_Previews: PreviewProvider {
    static var previews: some View {
      AlertTest()
    }
  }
}
