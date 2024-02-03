//
//  ImageMedia.swift
//  AppTemplate
//
//  Created by Kaloyan Petkov on 3.10.23.
//

import Foundation
import UIKit
import Toolchain

struct ImageMedia: Codable {
    let key: String
    let data: Data?
    let mimeType: String
    
    init(withImage image: UIImage?, key: String) {
        let fixedImage = image?.getFixedImage()
        self.key = key
        self.mimeType = "image/jpeg"
        self.data = fixedImage?.jpegData(compressionQuality: 0.3)
    }
}
