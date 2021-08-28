//
//  InitView.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/28.
//

import SwiftUI

struct OverlayView : View {
    var body: some View {
        VStack {
            Circle().fill(Color.yellow.opacity(0.8))
                .frame(width: 250, height: 250, alignment: .center)
                // overlay
                .overlay(Text("Joystick").font(.largeTitle))
                .overlay(Image(systemName: "arrow.up").font(.title).padding(), alignment: .top)
                .overlay(Image(systemName: "arrow.left").font(.title).padding(), alignment: .leading)
                .overlay(Image(systemName: "arrow.up.right.circle.fill").font(.title).padding(), alignment: .topTrailing)
                //background
                .background(Image(systemName: "arrow.down").font(.title).padding(), alignment: .bottom)
                .background(Image(systemName: "arrow.right").font(.title).padding(), alignment: .trailing)
            
        }
        ZStack {
            VStack {
                Spacer()
                Image(systemName: "arrow.down").font(.title).padding()
            }
            HStack {
                Spacer()
                Image(systemName: "arrow.right").font(.title).padding()
            }
            Circle().fill(Color.yellow.opacity(0.8))
                .frame(width: 250, height: 250)
            Text("Joystick").font(.largeTitle)
            ZStack(alignment: .topTrailing, content: {
                Color.clear
                Image(systemName: "arrow.up.right.circle.fill").font(.title)
            })
            VStack {
                Image(systemName: "arrow.up").font(.title).padding()
                Spacer()
            }
            HStack {
                Image(systemName: "arrow.left").font(.title).padding()
                Spacer()
            }
        }.frame(width: 250, height: 250, alignment: .center)
    }
}

struct OverlayView_Previews: PreviewProvider {
    static var previews: some View {
        OverlayView()
    }
}

