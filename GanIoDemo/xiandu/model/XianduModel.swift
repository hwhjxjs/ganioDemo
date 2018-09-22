//
//  XianduModel.swift
//  GanIoDemo
//
//  Created by soft on 22/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import Foundation
import HandyJSON
class XianduModel: HandyJSON {
    var my_id : String!
    var enName : String!
    var name : String!
    var rank : Int!
    required init()
    {
        
    }
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.my_id <-- "_id"
        mapper <<< self.enName <-- "en_name"
//        mapper <<< self.createAt <-- "created_at"
//        mapper >>> self._id
//        mapper >>> self.single_id
    }
}

class XianduDetailModel: HandyJSON {
    var id : String!
    var createdAt : String!
    var icon : String!
    var title : String!
    var my_id : String!
    required init()
    {
        
    }
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.my_id <-- "_id"
        mapper <<< self.createdAt <-- "created_at"
        //        mapper >>> self._id
        //        mapper >>> self.single_id
    }
}

