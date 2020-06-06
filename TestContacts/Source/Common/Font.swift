//
//  Font.swift
//  TestContacts
//
//  Created by Marentilo on 06.06.2020.
//  Copyright © 2020 Marentilo. All rights reserved.
//

import UIKit

enum Font {
    case rowTitle
    case rowSubtitle
    
    var uiFont : UIFont {
        switch self {
        case .rowTitle: return UIFont.systemFont(ofSize: 18)
        case .rowSubtitle: return UIFont.systemFont(ofSize: 14)
        }
    }
}
