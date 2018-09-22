//
//  XianduNewTableViewCell.swift
//  GanIoDemo
//
//  Created by soft on 23/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit

class XianduNewTableViewCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
    var model =  XianduDetailModel(){
        didSet{
            titleLabel.text = model.title
            createDateLabel.text = model.createdAt
            let url :URL = URL(string: model.icon!)!
            self.myImageView.kf.setImage(with: url, placeholder: nil)
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    
    func setupUI()  {
        self.addSubview(myImageView)
        myImageView.snp.makeConstraints { (make) in
            make.centerY.equalTo(self)
            make.left.equalTo(self).offset(5)
            make.size.equalTo(CGSize(width: 40, height: 40))
        }
        
        self.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(-15)
            make.left.equalTo(myImageView.snp.right).offset(10)
            make.right.equalTo(self)
            make.height.equalTo(30)
        }
        
        self.addSubview(createDateLabel)
        createDateLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(self).offset(15)
            make.left.equalTo(myImageView.snp.right).offset(10)
            make.right.equalTo(self)
            make.height.equalTo(30)
        }
    }
    
    
    lazy var myImageView:UIImageView  = {
        var imageView: UIImageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    lazy var titleLabel:UILabel = {
        var titleLabel :UILabel = UILabel()
        return titleLabel
    }()
    
    lazy var createDateLabel:UILabel = {
        var label :UILabel = UILabel()
        label.textColor = UIColor.gray
        return label
    }()
    
    required init?(coder aDecoder: NSCoder) {
        //        fatalError("init(coder:) has not been implemented")
        super.init(coder: aDecoder)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
