//
//  TestTableViewCell.swift
//  GokiPoker
//
//  Created by 竹野祐輔 on 2017/12/27.
//  Copyright © 2017年 竹野祐輔. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var testCustomView: TestCustomView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
