//
//  NavigationView.swift
//  GanIoDemo
//
//  Created by soft on 20/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import IBAnimatable

class NavigationView: UIView , NibLoadable{

    @IBOutlet weak var searchButton: UISearchBar!
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
//        searchButton.theme_backgroundColor = "colors.cellBackgroundColor"
//        searchButton.theme_setTitleColor("colors.grayColor150", forState: .normal)

    }
    
    
    /// 固有的大小
    override var intrinsicContentSize: CGSize {
        return UILayoutFittingExpandedSize
    }
    
    /// 重写 frame
    override var frame: CGRect {
        didSet {
            super.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: 44)
        }
    }

}
