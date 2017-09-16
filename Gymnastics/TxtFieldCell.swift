//
//  TxtFieldCell.swift
//  Gymnastics
//
//  Created by Rakhi on 9/9/17.
//  Copyright © 2017 rakhi. All rights reserved.
//

import UIKit

class TxtFieldCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var txtField: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
