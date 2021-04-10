//
//  KoreaItem.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/04/05.
//

import Foundation

struct KoreanItems: Decodable {
    enum CodingKeys: String, CodingKey {
        case name
        case imageName = "image_name"
        case shortDescription = "short_desc"
        case description = "desc"
    }
    let name: String
    let imageName: String
    let shortDescription: String
    let description: String
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = (try? container.decode(String.self, forKey: .name)) ?? ""
        imageName = (try? container.decode(String.self, forKey: .imageName)) ?? ""
        shortDescription = (try? container.decode(String.self, forKey: .shortDescription)) ?? ""
        description = (try? container.decode(String.self, forKey: .description)) ?? ""
    }
}
