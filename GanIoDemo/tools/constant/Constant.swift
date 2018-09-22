//
//  Constant.swift
//  GanIoDemo
//
//  Created by soft on 20/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit

//宽度
let kScreenWidth = UIScreen.main.bounds.width
let kScreenHeight = UIScreen.main.bounds.height


let BASE_URL = "https://gank.io/api/"

//酷米客url
let KUMIKE_URL = "http://119.23.200.49:18366/"

/// 动态图片的宽高
// 图片的宽高
// 1        screenWidth * 0.5
// 2        (screenWidth - 35) / 2
// 3,4,5-9    (screenWidth - 40) / 3
let image1Width: CGFloat = kScreenWidth * 0.5
let image2Width: CGFloat = (kScreenWidth - 35) * 0.5
let image3Width: CGFloat = (kScreenWidth - 30) / 3
let image3Widthnew: CGFloat = (kScreenWidth - 60) / 3


let tableItemHeight: CGFloat = 60.0

let labelHeight = 20


