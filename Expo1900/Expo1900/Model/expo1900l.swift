//
//  expo1900.swift
//  Expo1900
//
//  Created by 오인탁 on 2021/09/27.
//

import Foundation

struct Expo1900: Decodable {
    var title: String
    var visitors: Int
    var location: String
    var duration: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case title, visitors, location, duration, description
    }
}
