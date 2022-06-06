//
//  Date.swift
//  DonWorry
//
//  Created by Chanhee Jeong on 2022/06/06.
//

import Foundation
import SwiftUI

extension String {
    
    func stringToDate() -> Date? { // "yyyy-MM-dd HH:mm:ss"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "GMT") // GMT
        if let date = dateFormatter.date(from: self) {
            return date
        } else {
            return nil
        }
        
    }
}
