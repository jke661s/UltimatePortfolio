//
//  Sequence-Sorting.swift
//  UltimatePortfolio
//
//  Created by Jackie Wang on 12/1/21.
//

import Foundation

extension Sequence {
    // Use keypath to sort, eg: projectItems.sorted(by: \Item.itemTitle).
    func sorted<Value>(by keyPath: KeyPath<Element, Value>, using areInIncreasingOrder: (Value, Value) throws -> Bool) rethrows -> [Element] {
        try self.sorted {
            try areInIncreasingOrder($0[keyPath: keyPath], $1[keyPath: keyPath])
        }
    }
    
    func sorted<Value: Comparable>(by keyPath: KeyPath<Element, Value>) -> [Element] {
        self.sorted(by: keyPath, using: <)
    }
}
