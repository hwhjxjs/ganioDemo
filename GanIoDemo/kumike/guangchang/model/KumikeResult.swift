//
//	RootClass.swift
//
//	Create by soft on 23/8/2018
//	Copyright © 2018. All rights reserved.
//	Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport

import Foundation
import HandyJSON


class KumikeResult :HandyJSON {
    
    required init() {
        
    }
    

	var data : Data!
	var errcode : Int!
	var msg : String!
	var success : Bool!

}

class Data : HandyJSON{
    
    required init() {
        
    }
    
    
    var activities : [Activity]!
    var chatrooms : [Chatroom]!
    var moreChatrooms : Int!
    var readpos : Readpo!
    var sections : [Section]!
    var topics : [Topic]!
    
    
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.moreChatrooms <-- "more_chatrooms"
        //        mapper <<< self.enName <-- "en_name"
        //        mapper <<< self.createAt <-- "created_at"
        //        mapper >>> self.moreChatrooms
        //        mapper >>> self.single_id
    }
}


class Mark : HandyJSON{
    required init() {
        
    }
    
    
    var alphaRec : Int!
    var classic : Int!
    var hot : Int!
    var redpacket : Int!
    var sp : Int!
    var squareTop : Int!
    var top : Int!
    var verify : Int!
}

class Readpo : HandyJSON{
    required init() {
        
    }
    var id : Int!
    var pointer : Float!
    var type : String!
}

class Static : HandyJSON{
    required init() {
        
    }
    
    
    var praisecount : Int!
    var replycount : Int!
    var seecnt : Int!
}

class Topic : HandyJSON{
    required init() {
        
    }
    
    
    var commentPid : Int!
    var content : String!
    var createTime : Int!
    var displayTime : Int!
    var id : Int!
    var mark : Mark!
    var pictures : [Picture]!
    var praiseFlag : Int!
    var section : Section!
    var staticField : Static!
    var user : User!
    
    
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.createTime <-- "create_time"
        mapper <<< self.displayTime <-- "display_time"
        mapper <<< self.praiseFlag <-- "praise_flag"
        mapper <<< self.commentPid <-- "comment_pid"
        mapper <<< self.staticField <-- "Static"
        //        mapper <<< self.enName <-- "en_name"
        //        mapper <<< self.createAt <-- "created_at"
        //        mapper >>> self._id
        //        mapper >>> self.single_id
    }
    
    
    func heightForCell() -> CGFloat {
        //文本高度
        let textheight:CGFloat =  content.textHeight(fontSize: 13, width: (kScreenWidth - 43))
        var imageHeight:CGFloat = 0
        if(pictures == nil || pictures.count == 0)
        {
            imageHeight = 0
        }
        else if( pictures.count == 1)
        {
            var width:CGFloat  = 0
            if(pictures[0].width == nil)
            {
                width = 100
            }
            imageHeight = width*1.5
        }
        else
        {
            let count:Int = (pictures.count+2)/3
            imageHeight = image3Width*CGFloat(count)
        }
        
        let allHeight = 90 + imageHeight + textheight
        return allHeight
        
    }
    
    
}


class User : HandyJSON{
    required init() {
        
    }
    var img : String!
    var label : String!
    var listen : Int!
    var name : String!
    var uid : Int!
    var vtype : Int!
}


class Section : HandyJSON{
    required init() {
        
    }
    
    
    var citycode : String!
    var desc : String!
    var hot : Int!
    var id : Int!
    var img : String!
    var mark : Int!
    var name : String!
}




class Picture : HandyJSON{
    required init() {
        
    }
    var height : CGFloat!
    var picture : String!
    var width : CGFloat!
}



class Chatroom : HandyJSON{
    required init() {
        
    }
    
    
    var id : Int!
    var image : String!
    var memberCnt : Int!
    var mode : Int!
    var subject : String!
    
    func mapping(mapper: HelpingMapper) {
        mapper <<< self.memberCnt <-- "member_cnt"
        //        mapper <<< self.enName <-- "en_name"
        //        mapper <<< self.createAt <-- "created_at"
        //        mapper >>> self._id
        //        mapper >>> self.single_id
    }
    
    
    
    
}


class Activity : HandyJSON{
    
    required init() {
        
    }
    
    var citycode : String!
    var id : Int!
    var img : String!
    var title : String!
    var type : Int!
    
    
}

