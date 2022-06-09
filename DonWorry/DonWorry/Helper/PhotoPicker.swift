//  https://www.hackingwithswift.com/books/ios-swiftui/importing-an-image-into-swiftui-using-phpickerviewcontroller
//  PhotoPicker.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//
// 사용자 라이브러리에서 사진 선택

import SwiftUI
import PhotosUI

extension PHPickerConfiguration {
    static let config: PHPickerConfiguration = {
        var tempConfig = PHPickerConfiguration(photoLibrary: .shared())
        tempConfig.selectionLimit = 1
        tempConfig.filter = .images
        return tempConfig
    }()
}

struct PhotoPicker: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = PHPickerViewController
    
    let configuration: PHPickerConfiguration
    @Binding var images: [UIImage]
//    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: PHPickerViewControllerDelegate {
      
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            picker.dismiss(animated: true)
            
            let itemProviders = results.map { $0.itemProvider }
            
            var tempImages: [UIImage] = []
            
            itemProviders.forEach { itemProvider in
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, _ in
                        guard let self = self else { return }
                                                if let uiImage = image as? UIImage {
                                                    tempImages.append(uiImage)
                                                    self.parent.images = tempImages
                                                }
                    }
                }
            }
        }
    }
}
