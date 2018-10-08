//
//  EmptyStatusCell.swift
//  Series
//
//  Created by SARA CORREAS GORDITO on 8/10/18.
//  Copyright © 2018 ÁLVARO BARRADO FERNÁNDEZ. All rights reserved.
//

import UIKit

protocol EmptyStatusCellDelegate: class {
    func emptyStatusCellDidPressBack(cell: EmptyStatusCell)
}

class EmptyStatusCell: UITableViewCell {
    weak var delegate: EmptyStatusCellDelegate?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func backButtonPressed() {
        delegate?.emptyStatusCellDidPressBack(cell: self)
    }
    
}
