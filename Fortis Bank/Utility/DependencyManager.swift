//
//  DependencyManager.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import Foundation

class DependencyManager {
    
    static func readPlist(resource: String, typeOf: String, key: String) -> Any {
        var value: Any = ""
        if let path = Bundle.main.path(forResource: resource, ofType: typeOf) {
            if let dic = NSDictionary(contentsOfFile: path) as? [String: Any] {
                value = dic[key]!
            }
        }
        return value
    }
}
