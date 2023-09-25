//
//  GreyRoundedCell.swift
//  test-vkus-sovet-uikit
//
//  Created by Danil Peregorodiev on 25.09.2023.
//

import UIKit

class GrayRoundedCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configureCell()
    }
    
    private func configureCell() {
        backgroundColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0) // Светло-серый цвет фона
        layer.cornerRadius = 15
    }
}
