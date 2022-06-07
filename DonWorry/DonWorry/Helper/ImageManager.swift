//
//  ImageManager.swift
//  DonWorry
//
//  Created by 임영후 on 2022/06/03.
//

// 이미지를 관리하는 객체
import UIKit

final class ImageManager {
    
    static let instance = ImageManager()
    
    private init() { }
    
    // 이미지를 저장하는 기능
    func saveImage(uiImage: UIImage) -> String {
        let imageData = uiImage.jpegData(compressionQuality: 0.5)
        guard let imageData = imageData else { return "" }
        
        if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            let filName = "\(UUID().uuidString).jpeg"
            let filePath = url.appendingPathComponent(filName)
            
            do {
                try imageData.write(to: filePath)
            } catch {
                print(error.localizedDescription)
            }
            return filName
        }
        return ""
    }
    
    // 이미지를 가져오는 기능
    func getImage(named: String) -> UIImage {
        if let dir = try? FileManager.default.url(for: .documentDirectory,
                                                  in: .userDomainMask,
                                                  appropriateFor: nil,
                                                  create: false) {
            let url = URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path
            return UIImage(contentsOfFile: url) ?? UIImage()
        }
        return UIImage()
    }
}
