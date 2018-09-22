//
//  XianduTableViewCell.swift
//  GanIoDemo
//
//  Created by soft on 22/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit

class XianduTableViewCell: UITableViewCell {
    
    var model  = XianduDetailModel()
    {
        didSet{
            let url :URL = URL(string: model.icon!)!
            self.logoIv.kf.setImage(with: url, placeholder: nil)
            self.titleLabel.text = model.title
            self.createTimeLabel.text = model.createdAt
        }
    }

    @IBOutlet weak var logoIv: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    
    @IBOutlet weak var createTimeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
