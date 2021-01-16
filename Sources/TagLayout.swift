//
//  TagLayout.swift
//
//
//  Created by udbhateja on 15/02/20.
//  Copyright © 2020 Uday Bhateja. All rights reserved.
//

import UIKit

// MARK: - TagLayout
public class TagLayout: UICollectionViewLayout {

    // MARK: Variables
    weak public var delegate        : TagLayoutDelegate?
    public var cellSpacing          : CGFloat = 10.0
    public var scrollDirection      : UICollectionView.ScrollDirection = .vertical
    private var contentWidth        : CGFloat = 0
    private var contentHeight       : CGFloat = 0
    private var cache               : [UICollectionViewLayoutAttributes] = []
    private let defaultRowHeight    : CGFloat = 30.0
    private let defaultCellWidth    : CGFloat = 75.0
    
    // MARK: Public Functions
    public func reset() {
        cache.removeAll()
        contentHeight   = 0
        contentWidth    = 0
    }
    
    // MARK: Override
    public override init() {
        super.init()
    }
    required init?(coder: NSCoder) {
        super.init()
    }
    
    public override var collectionViewContentSize: CGSize {
        return CGSize(width: contentWidth, height: contentHeight)
    }
    
    public override func prepare() {
        super.prepare()
        if scrollDirection == .vertical {
            prepareForVerticalScroll()
        }
        else {
            prepareForHorizontalScroll()
        }
    }
    
    public override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        var visibleLayoutAttributeElements: [UICollectionViewLayoutAttributes] = []
        for attribute in cache {
            if attribute.frame.intersects(rect) {
                visibleLayoutAttributeElements.append(attribute)
            }
        }
        return visibleLayoutAttributeElements
    }
    
    public override func layoutAttributesForItem(at indexPath: IndexPath) -> UICollectionViewLayoutAttributes? {
        return cache[indexPath.item]
    }
    
    // MARK: Private Functions
    private func prepareForVerticalScroll() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let noOfItems   = collectionView.numberOfItems(inSection: 0)
        var xOffset     = [CGFloat](repeating: 0.0, count: noOfItems)
        var yOffset     = [CGFloat](repeating: 0.0, count: noOfItems)
        
        let insets      = collectionView.contentInset
        contentWidth    = collectionView.bounds.width - (insets.left + insets.right)
        
        let height = (delegate?.rowHeight() ?? defaultRowHeight) + (cellSpacing*2)
        
        var rowWidth: CGFloat = 0
        for i in 0 ..< noOfItems {
            let indexPath = IndexPath(item: i, section: 0)
            let textWidth = delegate?.widthForItem(at: indexPath) ?? defaultCellWidth
            let width = textWidth + (cellSpacing*2)
            let frame = CGRect(
                x: xOffset[i],
                y: yOffset[i],
                width: width,
                height: height
            )
            let insetFrame = frame.insetBy(dx: cellSpacing, dy: cellSpacing)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentHeight = max(contentHeight, frame.maxY)
            
            rowWidth += frame.width
            
            if i < noOfItems-1 {
                let nextIP = IndexPath(item: i+1, section: 0)
                let nextWidth = delegate?.widthForItem(at: nextIP) ?? defaultCellWidth
                if rowWidth + nextWidth + cellSpacing <= contentWidth {
                    xOffset[i+1] = xOffset[i] + width
                    yOffset[i+1] = yOffset[i]
                }
                else {
                    rowWidth = 0
                    yOffset[i+1] = yOffset[i] + height
                }
            }
        }
    }
    
    private func prepareForHorizontalScroll() {
        guard cache.isEmpty, let collectionView = collectionView else {
            return
        }
        
        let insets      = collectionView.contentInset
        contentHeight   = collectionView.bounds.height - (insets.top + insets.bottom)
        
        let rowHeight   = (delegate?.rowHeight() ?? defaultRowHeight) + (cellSpacing*2)
        let noOfRows    = Int(contentHeight / rowHeight)
        var yOffset: [CGFloat] = []
        for row in 0 ..< noOfRows {
            yOffset.append(CGFloat(row) * rowHeight)
        }
        
        var row = 0
        var xOffset: [CGFloat] = [CGFloat](repeating: 0.0, count: noOfRows)
        
        for i in 0 ..< collectionView.numberOfItems(inSection: 0) {
            let indexPath = IndexPath(item: i, section: 0)
            let textWidth = delegate?.widthForItem(at: indexPath) ?? defaultCellWidth
            let width = textWidth + (cellSpacing*2)
            let frame = CGRect(
                x       : xOffset[row],
                y       : yOffset[row],
                width   : width,
                height  : rowHeight)
            let insetFrame = frame.insetBy(dx: cellSpacing, dy: cellSpacing)
            
            let attributes = UICollectionViewLayoutAttributes(forCellWith: indexPath)
            attributes.frame = insetFrame
            cache.append(attributes)
            
            contentWidth = max(contentWidth, frame.maxX)
            xOffset[row] = xOffset[row] + width
            
            row = row < (noOfRows - 1) ? row + 1 : 0
        }
    }
}
