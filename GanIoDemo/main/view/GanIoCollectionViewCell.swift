//
//  GanIoCollectionViewCell.swift
//  GanIoDemo
//
//  Created by soft on 22/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import SnapKit
class GanIoCollectionViewCell: UICollectionViewCell{
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
 
    override func awakeFromNib() {
        super.awakeFromNib()
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI()  {
        self.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.bottom.left.right.equalTo(self)
        }
    }
    
    lazy var  imageView  :UIImageView = {
        
        var imageView = UIImageView()
        return imageView
    }()
    
    
}
