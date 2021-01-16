//
//  TagLayoutDelegate.swift
//  TagLayout
//
//  Created by Uday Bhateja on 10/01/21.
//

import Foundation

// MARK: - TagLayoutDelegate
public protocol TagLayoutDelegate: class {
    func widthForItem(at indexPath: IndexPath) -> CGFloat
    func rowHeight() -> CGFloat
}
