//
//  Data.swift
//  TagLayoutDemo
//
//  Created by Uday Bhateja on 09/01/21.
//

import UIKit

var data: [String] = [
    "Daenerys",
    "Jon Snow",
    "Tyrion",
    "Cersei",
    "Arya",
    "Sansa",
    "Jaime ",
    "Eddard Ned",
    "Littlefinger",
    "Joffrey",
    "Brienne of Tarth",
    "Varys",
    "Tywin",
    "Hound",
    "Bran Stark",
    "Samwell Tarley",
    "Melisandre",
    "Tormund",
    "Oberyn Martell",
    "Stannis",
    "Theon Greyjoy",
    "Khal Drogo",
    "Hodor",
    "Daenerys",
    "Jon Snow",
    "Tyrion",
    "Cersei",
    "Arya",
    "Sansa",
    "Jaime ",
    "Eddard Ned",
    "Littlefinger",
    "Joffrey",
    "Brienne of Tarth",
    "Varys",
    "Tywin",
    "Hound",
    "Bran Stark",
    "Samwell Tarley",
    "Melisandre",
    "Tormund",
    "Oberyn Martell",
    "Stannis",
    "Theon Greyjoy",
    "Khal Drogo",
    "Hodor",
    "Daenerys",
    "Jon Snow",
    "Tyrion",
    "Cersei",
    "Arya",
    "Sansa",
    "Jaime ",
    "Eddard Ned",
    "Littlefinger",
    "Joffrey",
    "Brienne of Tarth",
    "Varys",
    "Tywin",
    "Hound",
    "Bran Stark",
    "Samwell Tarley",
    "Melisandre",
    "Tormund",
    "Oberyn Martell",
    "Stannis",
    "Theon Greyjoy",
    "Khal Drogo",
    "Hodor"
]


extension String {
    func width(withHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(
            with: constraintRect,
            options: .usesLineFragmentOrigin,
            attributes: [NSAttributedString.Key.font: font],
            context: nil)
        return ceil(boundingBox.width)
    }
}
