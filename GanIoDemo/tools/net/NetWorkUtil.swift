//
//  NetWorkUtil.swift
//  GanIoDemo
//
//  Created by soft on 21/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol NetworkUtilProtocal {
    /**
    * 加载今天的数据
    */
   static func loadTodayData(completionHandler: @escaping (_ result: GanIoResultBean ) -> ())
    
    
    /**
    * 闲读
    */
    static func loadXianduData(completionHandler: @escaping (_ result: BaseResponse<XianduModel>)-> ())
    
    
    /**
     * 闲读详情
     */
    static func loadXianduDetail(category:String ,completionHandler: @escaping (_ result: BaseResponse<XianduDetailModel>)-> ())
    
    
    /**
    * 酷米客广场url
    * http://119.23.200.49:18366/1/topic?appid=84&apptype=bus&citycode=860515&cn=gm&http_seq=1535004749136&lat=22.700522&lng=113.993227&method=getByCity&n=96a13d85affd36083a099f102f5878196c4dde15&network_type=1&os=iOS&sign=E162617216CA3DD622B517213E51092F04135F4B9624BC2A23CB904CB6C5CD08&t=1535009284&tab_idx=0&type=1&ver=4.14.4
    */
    static func loadKumike(curPage:Int,  completionHandler: @escaping (_ result: KumikeResult)-> ())
    
    
    static func loadTiezi(completionHandler: @escaping (TiziResult) -> ())
    
}


class NetWorkUtil: NetworkUtilProtocal {
    
    /**
     * 酷米客广场url
     * http://119.23.200.49:18366/1/topic?appid=84&apptype=bus&citycode=860515&cn=gm&http_seq=1535071766269&lat=22.700546&lng=113.993201&method=getByCity&n=96a13d85affd36083a099f102f5878196c4dde15&network_type=1&os=iOS&sign=AFC3AE964FED098375A832B6B712AFEDDB3240E8F6CBAFA8D7BA29F62E099096&t=1535073020&tab_idx=0&type=1&ver=4.14.4
     */
    static func loadKumike(curPage:Int,completionHandler: @escaping (KumikeResult) -> ()) {
        let url = KUMIKE_URL + "1/topic"
        let params = ["appid":"84",
                      "apptype":"bus",
                      "citycode":"860515",
                      "cn":"gm",
                      "http_seq":"1535004749136",
                      "lat":"22.700522",
                      "lng":"113.993227",
                      "method":"getByCity",
                      "n":"96a13d85affd36083a099f102f5878196c4dde15",
                      "network_type":"1",
                      "os":"iOS",
                      "sign":"AFC3AE964FED098375A832B6B712AFEDDB3240E8F6CBAFA8D7BA29F62E099096",
                      "t":"1535073020",
                      "tab_idx":curPage.convertString(),
                      "type":"1",
                      "ver":"4.14.4"]
        print("当前页面",curPage.convertString())
        Alamofire.request(url,method : .post , parameters : params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {return}
                if let value = response.result.value{
                    
                    let json = JSON(value)
                    completionHandler(KumikeResult.deserialize(from: json.dictionaryObject)!)
                }
        }
    }
    
    /**
     * 酷米客帖子
     http://47.92.39.207:18366/1/topic?id=32143726&method=getDetail&apptype=bus&display_uid=&cn=gm&praise_num=6&ticket=2%7Cqqw8sofy3k8p%2Fhn00WJmsH8aCZD3QIbtc2KRtW1vVpLjazThkVYLE9g5I3jhsz9c8Z%2FX4Jvj5M55WbU8p5h1K4gLDyoFbJNIQbgHIkGQHYk%3D&os=iOS&citycode=860515&appid=84&ver=4.14.4&t=1535179284&http_seq=52&lat=22.655888&lng=114.008515&sign=99C8BD72F614B88DC7A592E308D1DCF82F1CB917B5201DD27B7E794EAD8A900F&n=d41d8cd98f00b204e9800998ecf8427eb2a470a9&network_type=1
     */
    static func loadTiezi(completionHandler: @escaping (TiziResult) -> ()) {
        let url = "http://47.92.39.207:18366" + "/1/topic"
        let params = ["id":"32143726",
                      "method":"getDetail",
                      "apptype":"bus",
                      "display_uid":"",
                      "cn":"gm",
                      "praise_num":"6",                  "ticket":"2%7Cqqw8sofy3k8p%2Fhn00WJmsH8aCZD3QIbtc2KRtW1vVpLjazThkVYLE9g5I3jhsz9c8Z%2FX4Jvj5M55WbU8p5h1K4gLDyoFbJNIQbgHIkGQHYk%3D",
                      "os":"iOS",
                      "citycode":"860515",
                      "appid":"84",
                      "ver":"4.14.4",
                      "t":"1535179284",
                      "http_seq":"52",
                      "lat":"22.655888",
                      "lng":"114.008515",
                      "sign":"99C8BD72F614B88DC7A592E308D1DCF82F1CB917B5201DD27B7E794EAD8A900F",
                      "n":"d41d8cd98f00b204e9800998ecf8427eb2a470a9",
                      "network_type":"1"]
        Alamofire.request(url,method : .get , parameters : params)
            .responseJSON { (response) in
                guard response.result.isSuccess else {return}
                if let value = response.result.value{
                    
                    let json = JSON(value)
                    completionHandler(TiziResult.deserialize(from: json.dictionaryObject)!)
                }
        }
    }

    
    
    
    /**
     * 闲读详情
     */
    static func loadXianduDetail(category: String, completionHandler: @escaping (BaseResponse<XianduDetailModel>) -> ()){
        var url = BASE_URL + "xiandu/category/"
        url += category
        Alamofire.request(url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {return}
                if let value = response.result.value{
                    let json = JSON(value)
                    completionHandler(BaseResponse<XianduDetailModel>.deserialize(from: json.dictionaryObject)!)
                }
        }
    }
    
   
    
    /**
     * 闲读
     */
    static func loadXianduData(completionHandler: @escaping (BaseResponse<XianduModel>) -> ()) {
        let url = BASE_URL + "xiandu/categories"
        Alamofire.request(url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {return}
                if let value = response.result.value{
                    let json = JSON(value)
                    let datas =  json["results"]
                    print(datas)
                    completionHandler(BaseResponse<XianduModel>.deserialize(from: json.dictionaryObject)!)
                }
        }
    }
    
    
    /**
     * 加载今天的数据
     */
    static func loadTodayData(completionHandler: @escaping (GanIoResultBean) -> ()) {
        let url = BASE_URL + "today"
        Alamofire.request(url)
            .responseJSON { (response) in
                guard response.result.isSuccess else {
                    return
                }

                if let value = response.result.value  {
                    let json = JSON(value)
//                    let titles = json["category"].arrayObject
//                    let results = json["results"].dictionaryObject
//                    let myResult = results?.index(forKey: "Android")
                    completionHandler(GanIoResultBean.deserialize(from: json.dictionaryObject)! )
                }
                
    
        }
    }
    
    
}


