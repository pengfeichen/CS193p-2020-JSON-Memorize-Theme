//
//  Array+Only.swift
//  Memorize
//
//  Created by Pengfei Chen on 1/11/21.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
