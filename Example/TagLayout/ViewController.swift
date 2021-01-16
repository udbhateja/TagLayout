//
//  ViewController.swift
//  TagLayoutDemo
//
//  Created by Uday Bhateja on 08/01/21.
//

import UIKit
import TagLayout

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!

    var tagLayout = TagLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tagLayout.delegate = self
        tagLayout.scrollDirection = .horizontal
        tagLayout.cellSpacing = 5.0
        collectionView.setCollectionViewLayout(tagLayout, animated: true)
    }
    
    @IBAction func segmentValueChanged(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            tagLayout.scrollDirection = .horizontal
        }
        else {
            tagLayout.scrollDirection = .vertical
        }
        tagLayout.reset()
        collectionView.reloadData()
    }
}

// MARK: - CollectionView
extension ViewController: UICollectionViewDataSource, TagLayoutDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! DataCell
        cell.titleLabel.text = data[indexPath.item]
        return cell
    }
    
    func widthForItem(at indexPath: IndexPath) -> CGFloat {
        let textWidth = data[indexPath.item].width(withHeight: 50.0, font: .systemFont(ofSize: 17.0))
        let extraPadding: CGFloat = 20.0 //Extra Padding for aesthetics
        return textWidth + extraPadding
    }
    
    func rowHeight() -> CGFloat {
        return 40.0
    }
}
