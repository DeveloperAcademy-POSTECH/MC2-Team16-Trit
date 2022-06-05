//
//  PhotoPicker.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import PhotosUI
import SwiftUI

// MARK: Example
//    .sheet(isPresented: $isPresented) {
//                let configuration = PHPickerConfiguration(photoLibrary: PHPhotoLibrary.shared())
//                PhotoPicker(configuration: configuration, isPresented: $isPresented)
//    }

extension PHPickerConfiguration {
    static let config: PHPickerConfiguration = {
        var tempConfig = PHPickerConfiguration(photoLibrary: .shared())
        tempConfig.selectionLimit = 1
        tempConfig.filter = .images
        return tempConfig
    }()
}

struct PhotoPicker: UIViewControllerRepresentable {
    
    let configuration: PHPickerConfiguration
    @Binding var images: [UIImage]
    @Binding var isPresented: Bool
    
    func makeUIViewController(context: Context) -> PHPickerViewController {
        let controller = PHPickerViewController(configuration: configuration)
        controller.delegate = context.coordinator
        return controller
    }
    func updateUIViewController(_ uiViewController: PHPickerViewController, context: Context) { }
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    // Use a Coordinator to act as your PHPickerViewControllerDelegate
    class Coordinator: PHPickerViewControllerDelegate {
      
        private let parent: PhotoPicker
        
        init(_ parent: PhotoPicker) {
            self.parent = parent
        }
        
        func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
            
            let itemProviders = results.map{ $0.itemProvider }
            
            var tempImages: [UIImage] = []
            
            itemProviders.forEach { itemProvider in
                if itemProvider.canLoadObject(ofClass: UIImage.self) {
                    itemProvider.loadObject(ofClass: UIImage.self) { [weak self] image, error in
                        if let uiImage = image as? UIImage {
                            tempImages.append(uiImage)
                            self?.parent.isPresented = false
                            self?.parent.images = tempImages
                        }
                    }
                }
            }
        }
    }
}
