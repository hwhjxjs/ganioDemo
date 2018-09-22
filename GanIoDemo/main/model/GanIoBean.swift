//
//  GanIoBean.swift
//  GanIoDemo
//
//  Created by soft on 21/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import Foundation
import HandyJSON

class GanIoBean: HandyJSON {
    
    required init() {
       
    }
    
    var id : String!
    var createdAt : String!
    var desc : String!
    var images : [String]?
    var publishedAt : String!
    var source : String!
    var type : String!
    var url : String!
    var used : Bool!
    var who : String!
    
    
    /**
    * 图片控件的高度
    */
    func heightForImageCollect() -> CGFloat {
        if(images == nil || images?.count == 0 )
        {
            return 0
        }
        else if((images?.count)! <= 3)
        {
            return CGFloat(image3Width)
        }
        else
        {
            return CGFloat(image3Width*2)
        }
    }
    
}


class GanIoResultBean: HandyJSON {
    var category : [String]!
    var error:Bool = false
    
    var results : Dictionary<String, [GanIoBean]>!
    
    required init() {
        
    }
}
