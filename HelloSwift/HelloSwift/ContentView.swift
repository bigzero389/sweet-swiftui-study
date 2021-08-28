//
//  ContentView.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/23.
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack(spacing: 30) {
            Text("Hello SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
            Image(systemName: "book.fill").imageScale(.small)
            Image(systemName: "star.circle")
        }
        HStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, spacing: /*@START_MENU_TOKEN@*/nil/*@END_MENU_TOKEN@*/, content: {
        })
            
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }    
}
