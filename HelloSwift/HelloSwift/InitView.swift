//
//  InitView.swift
//  HelloSwift
//
//  Created by bigzero on 2021/08/28.
//

import SwiftUI

struct InitView : View {
    var body: some View {
        VStack(alignment: .center ,spacing: 10) {
            Text("Hello SwiftUI")
                .font(.largeTitle)
                .foregroundColor(.orange)
                .fontWeight(/*@START_MENU_TOKEN@*/.heavy/*@END_MENU_TOKEN@*/)
        }
    }
}

struct InitView_Previews: PreviewProvider {
    static var previews: some View {
        InitView()
    }
}

