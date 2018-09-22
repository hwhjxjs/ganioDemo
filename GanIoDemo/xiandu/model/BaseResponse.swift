//
//  BaseResponse.swift
//  GanIoDemo
//
//  Created by soft on 22/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import Foundation
import HandyJSON

class BaseResponse<T: HandyJSON>: HandyJSON {
    var error: Bool? // 服务端返回码
    var results: [T]? // 具体的data的格式和业务相关，故用泛型定义
    
    public required init() {}
}
