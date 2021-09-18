//
//  ImagePicckerView.swift
//  FruitMart
//
//  Created by bigzero on 2021/09/18.
//

import SwiftUI
import UIKit

struct ImagePickerView: UIViewControllerRepresentable {
  @Binding var pickedImage: Image
  
  func makeUIViewController(context: Context) -> UIImagePickerController {
    let imagePickerController = UIImagePickerController()
    imagePickerController.delegate = context.coordinator
    imagePickerController.allowsEditing = true
    return imagePickerController
  }
  
  func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
  }
  
  final class Coordinator: NSObject {
    let parent: ImagePickerView
    init(_ imagePickerView: ImagePickerView) {
      self.parent = imagePickerView
    }
  }
  
  func makeCoordinator() -> Coordinator {
    Coordinator(self)
  }
}

// MARK: - Delegate
extension ImagePickerView.Coordinator: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
  func imagePickerController(
    _ picker: UIImagePickerController,
    didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
  ) {
    let originalImage = info[.originalImage] as! UIImage
    let editedIamge = info[.editedImage] as? UIImage
    let selectedImage = editedIamge ?? originalImage
    parent.pickedImage = Image(uiImage: selectedImage)
    picker.dismiss(animated: true, completion: nil)
  }
}


//struct ImagePicckerView_Previews: PreviewProvider {
//  static var previews: some View {
//    ImagePickerView()
//  }
//}
