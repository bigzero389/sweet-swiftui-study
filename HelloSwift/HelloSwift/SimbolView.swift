//
//  ContentView.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/23.
//
//

import SwiftUI

struct SimbolView: View {
    var body: some View {
        VStack(alignment: .center ,spacing: 10) {
            Text("Simbol Sample")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
            HStack(spacing: 10) {   // simbol
                Image(systemName: "book.fill")
                    .imageScale(.small)
                    .font(.title)
                Image(systemName: "book.fill")
                    .imageScale(.medium)
                    .foregroundColor(.green)
                Image(systemName: "star.circle")
            }
            HStack(spacing: 10) {   // font weight
                Image(systemName: "arrow.up")
                    .font(.title)
                Image(systemName: "arrow.up")
                    .font(Font.title.weight(.ultraLight))
                Image(systemName: "arrow.up")
            }
        }
    }
}


struct View_Previews: PreviewProvider {
    static var previews: some View {
        SimbolView()
//        StackView()
    }
}
