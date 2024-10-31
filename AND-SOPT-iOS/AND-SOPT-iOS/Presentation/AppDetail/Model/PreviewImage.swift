//
//  PreivewImage.swift
//  AND-SOPT-iOS
//
//  Created by 김예지 on 10/30/24.
//

import Foundation
import UIKit

struct PreviewImage: Hashable {
    var id = UUID()
    let image: UIImage
}

extension PreviewImage {
    static let previewImages: [PreviewImage] = [
        PreviewImage(image: UIImage(named: "tossPreview1.png")!),
        PreviewImage(image: UIImage(named: "tossPreview2.png")!),
        PreviewImage(image: UIImage(named: "tossPreview3.png")!),
        PreviewImage(image: UIImage(named: "tossPreview4.png")!),
        PreviewImage(image: UIImage(named: "tossPreview5.png")!)
    ]
}
