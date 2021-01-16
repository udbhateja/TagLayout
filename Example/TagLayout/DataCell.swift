//
//  DataCell.swift
//  TagLayoutDemo
//
//  Created by Uday Bhateja on 09/01/21.
//

import UIKit

class DataCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override  func awakeFromNib() {
        layer.cornerRadius = 20.0
    }
}
