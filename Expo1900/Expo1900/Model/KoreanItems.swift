//
//  KoreanItems.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/10/19.
//

import Foundation

struct KoreanItems: Codable {
    var name: String
    var imageName: String
    var shortDesc: String
    var desc: String
    
    enum CodingKeys: String, CodingKey {
        case name, desc
        case imageName = "image_name"
        case shortDesc = "short_desc"
    }
}
