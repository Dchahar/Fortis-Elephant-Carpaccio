//
//  Constant.swift
//  Fortis Bank
//
//  Created by Dheeraj Chahar on 16/04/19.
//  Copyright © 2019 Tata Consultancy Services. All rights reserved.
//

import Foundation

// Form Type
public enum DiscountRate : Float {
    case greaterThanThousand  = 3
    case greaterThanFiveThousand  = 5
    case greaterThanSevenThousand  = 7
    case greaterThanTenThousand  = 10
    case greaterThanFiftyThousand  = 15
}

// Storyboard Seages
enum StoryboardSegue {
    case itemAddedSegue
    
    var identifier: String {
        switch self {
        case .itemAddedSegue: return "itemAddedSegue"
        }
    }
}
