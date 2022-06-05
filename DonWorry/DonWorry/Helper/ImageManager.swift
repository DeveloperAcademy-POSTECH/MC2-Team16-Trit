//
//  ImageManager.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

import Foundation
import UIKit

class ImageManager {
    
    static let instance = ImageManager()
    
    private init() { }
    
    func saveImage(uiImage: UIImage) -> String {
        let imageData = uiImage.jpegData(compressionQuality: 0.5)
        guard let imageData = imageData else { return "" }
        
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        let filName = "\(UUID().uuidString).jpeg"
        let filePath = url.appendingPathComponent(filName)
        
        do {
            try imageData.write(to: filePath)
        } catch {
            print(error.localizedDescription)
        }
        
        return filName
    }
    
    func getImage(named: String) -> UIImage {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path) ?? UIImage()
        }
        return UIImage()
    }
}
