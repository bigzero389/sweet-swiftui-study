//
//  MainTabView.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/12.
//

import SwiftUI

struct MainTabView: View {
  private enum Tabs { case home, recipe, gallery, myPage }
  @State private var selectedTab: Tabs = .home
  
  var body: some View {
    TabView(selection: $selectedTab) {
      Group {
        home
        recipe
        imageGallery
        myPage
      }
      .accentColor(.primary)
    }
//    .statusBar(hidden: selectedTab == .recipe)
    .edgesIgnoringSafeArea(.top)  // iOS 13.4 이상부터는 제외해야 함. 이하는 포함, 이유는 아직 모름
    .accentColor(.peach)
    .statusBar(hidden: true)
  }
}

private extension MainTabView {
  var home: some View {
    Home()
      .tag(Tabs.home)
      .tabItem(image: "house", text: "홈")
//      .onAppear { UITableView.appearance().separatorStyle = .none } // iOS 14 부터 안된다고함.
  }
  
  var recipe: some View {
    RecipeView()
      .tag(Tabs.recipe)
      .tabItem(image: "book", text: "레시피")
  }
  
  var imageGallery: some View {
    Text("이미지 갤러리")
      .tag(Tabs.gallery)
      .tabItem(image: "photo.on.rectangle", text: "갤러리")
  }
  
  var myPage: some View {
    Text("마이페이지")
      .tag(Tabs.myPage)
      .tabItem(image: "person", text: "마이페이지")
  }
}


fileprivate extension View {
  func tabItem(image: String, text: String) -> some View {
    self.tabItem {
      Symbol(image, scale: .large)
        .font(Font.system(size: 17, weight: .light))
      Text(text)
    }
  }
}

// MARK: - Preview
struct MainTabView_Previews: PreviewProvider {
  static var previews: some View {
    Preview(source: MainTabView().environmentObject(Store()))
  }
}
