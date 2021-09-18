//
//  FormTest.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/16.
//

import SwiftUI

struct FormTest: View {
  var body: some View {
    NavigationView {
      Form {
        Section(header: Text("View").font(.headline)) {
          Text("text")
          Image(systemName: "gear").font(.title)
          Rectangle()
          Color.gray
        }
        Section(header: Text("control").font(.headline)){
          Button("button") {}
          TextField("placeholder", text:.constant("text field"))
            .textFieldStyle(RoundedBorderTextFieldStyle())
          SecureField("palceholder", text:.constant("secure field"))
          Slider(value: .constant(0.5))
          Toggle("toggle", isOn: .constant(true))
          Stepper("stepper", onIncrement: {}, onDecrement: {})
          Picker("picker", selection: .constant("option")) { Text("options").tag("options")}
          DatePicker(selection: .constant(Date())) { Text("DatePicker") }
        }
      }
      .navigationBarTitle("Form - View & Control")
    }
  }
}

struct FormTest_Previews: PreviewProvider {
  static var previews: some View {
    FormTest()
  }
}
