//
//  TieziModel.swift
//  GanIoDemo
//
//  Created by hwh on 25/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import Foundation
import HandyJSON

class TiziResult :HandyJSON{
    
    var data : TiziData!
    var errcode : Int!
    var msg : String!
    var success : Bool!
    
    required init()
    {
        
    }
    
}


class TiziData {
    var commentPid : Int!
    var content : String!
    var createTime : Int!
    var displayTime : Int!
    var id : Int!
    var location : Location!
    var mark : TiziMark!
    var pictures : [Picture]!
    var praiseFlag : Int!
    var praiseUser : [PraiseUser]!
    var section : TiziSection!
    var share : Share!
    var staticField : TiziStatic!
    var user : TiziUser!
    
}

class TiziMark{
    
    var alphaRec : Int!
    var classic : Int!
    var hot : Int!
    var redpacket : Int!
    var sp : Int!
    var squareTop : Int!
    var top : Int!
    var verify : Int!
    
}


class Share{
    
    var descriptionField : String!
    var pic : String!
    var title : String!
    var url : String!
}

class Location{
    
    var city : String!
    var district : String!
    var province : String!

}


class PraiseUser{
    
    var img : String!
    var label : String!
    var name : String!
    var uid : Int!
    
}

class TiziSection {
    var citycode : String!
    var id : Int!
    var name : String!
}


class TiziUser {
    var img : String!
    var label : String!
    var listen : Int!
    var name : String!
    var uid : Int!
    var vtype : Int!
}


class TiziStatic {
    var praisecount : Int!
    var replycount : Int!
    var seecnt : Int!
}
