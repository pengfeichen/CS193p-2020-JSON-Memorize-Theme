//
//  Array+JSON.swift
//  Memorize
//
//  Created by Pengfei Chen on 2/18/21.
//

import Foundation

extension Array where Element == Theme {
    var json: Data? {
         try? JSONEncoder().encode(self)
    }
}
