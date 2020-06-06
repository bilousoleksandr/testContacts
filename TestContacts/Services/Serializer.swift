//
//  Serializer.swift
//  TestContacts
//
//  Created by Marentilo on 05.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import Foundation

struct Serializer {
    static func deserialize<T: Codable> (_ data: Data, type: T.Type) -> T? {
        let decoder = JSONDecoder()
        let result = try? decoder.decode(type, from: data)
        return result
    }
    
    static func serialize<T: Codable> (_ value: T) -> Data? {
        let encoder = JSONEncoder()
        let data = try? encoder.encode(value)
        return data
    }
}
