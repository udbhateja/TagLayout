//
//  TagLayoutDelegate.swift
//  TagLayout
//
//  Created by Uday Bhateja on 10/01/21.
//

import Foundation

// MARK: - TagLayoutDelegate
public protocol TagLayoutDelegate: AnyObject {
    func widthForItem(at indexPath: IndexPath, layout: TagLayout) -> CGFloat
    func rowHeight(layout: TagLayout) -> CGFloat
}
