//
//  MyPage.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/16.
//

import SwiftUI

struct MyPage: View {
  @EnvironmentObject var store: Store // 앱 설정에 접근하기 위해 추가
  @State private var pickedImage: Image = Image(systemName: "person.crop.circle")
  @State private var nickname: String = ""
  @State private var isPickerPresented: Bool = false
  
  private let pickerDataSource: [CGFloat] = [140, 150, 160]
  
  var body: some View {
    NavigationView {
      VStack {
        userInfo
        Form {
          orderInfoSection
          appSettingSection
          productHeightPicker
        }
      }
      .navigationBarTitle("마이페이지")
    }
    .sheet(isPresented: $isPickerPresented, content: {
      ImagePickerView(pickedImage: self.$pickedImage)
    })
  }
  
  var orderInfoSection: some View {
    Section(header: Text("주문정보").fontWeight(.medium)) {
      NavigationLink(destination: OrderListView()) {
        Text("주문목록")
      }
      .frame(height: 44)
    }
  }
  
  var appSettingSection: some View {
    Section(header: Text("앱 설정").fontWeight(.medium)) {
      Toggle("즐겨찾는 상품표시", isOn: $store.appSetting.showFavoriteList)
        .frame(height: 44)
    }
  }
  
  var productHeightPicker: some View {
    VStack(alignment: .leading) {
      Text("상품 이미지 높이 조절")  // 피커의 제목역할을 대신 수행
      // SegmentedPickerStyle을 사용할 때는 피커 제목에 빈문자열을 전달해도 무방
      Picker("", selection: $store.appSetting.productRowHeight) {
        ForEach(pickerDataSource, id:\.self) {
          Text(String(format: "%.0f", $0)).tag($0)
        }
      }
      .pickerStyle(SegmentedPickerStyle())
    }
    .frame(height: 72)
  }
  
  var userInfo: some View {
    VStack {
      profileImage
      nicknameTextField
    }
    .frame(maxWidth: .infinity, minHeight: 200)
    .background(Color.background)
  }
  
  var profileImage: some View {
    pickedImage
      .resizable().scaledToFill()
      .clipShape(Circle())
      .frame(width: 100, height: 100)
      .overlay(pickImageButton.offset(x: 8, y: 0), alignment: .bottomTrailing)
  }
  
  var pickImageButton: some View {
    Button(action: { self.isPickerPresented = true }, label: {
      Circle()
        .fill(Color.white)
        .frame(width: 32, height: 32)
        .shadow(color: .primary, radius: 2, x: 2, y: 2)
        .overlay(Image("pencil").foregroundColor(.black))
    })
  }
  
  var nicknameTextField: some View {
    TextField("닉네임", text: $nickname)
      .font(.system(size: 25, weight: .medium))
      .textContentType(.nickname)
      .multilineTextAlignment(.center)
      .autocapitalization(.none)
  }
}

// MARK: - Preview
struct MyPage_Previews: PreviewProvider {
  static var previews: some View {
    Preview(source: MyPage().environmentObject(Store()))
  }
}
