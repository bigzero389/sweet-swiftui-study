//
//  SheetTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/05.
//

import SwiftUI

struct SheetTest: View {
  @State private var showingSheet = false
  
  var body: some View {
    Button(action: { self.showingSheet.toggle() }) {
      /*@START_MENU_TOKEN@*/Text("Button")/*@END_MENU_TOKEN@*/.font(.title).foregroundColor(.blue)
    }.sheet(
      isPresented: $showingSheet,
      onDismiss: { print("Dismissed") }
    ) {
      PresentedView()
    }
  }
}

struct PresentedView: View {
  @Environment(\.presentationMode) var presentationMode
  
  var body: some View {
    Button(action: {
      if self.presentationMode.wrappedValue.isPresented {
        self.presentationMode.wrappedValue.dismiss()
      }
    }) {
      Text("Tap to Dismiss").font(.title).foregroundColor(.red)
    }
  }
}

struct SheetTest_Previews: PreviewProvider {
  static var previews: some View {
    SheetTest()
  }
}
