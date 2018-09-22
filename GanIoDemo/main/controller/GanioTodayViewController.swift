//
//  GanioTodayViewController.swift
//  GanIoDemo
//
//  Created by soft on 20/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit
import SwiftyJSON
import SGPagingView
import RxSwift
import RxCocoa

class GanioTodayViewController: UIViewController {
    /// 自定义导航栏
    private lazy var navigationBar = NavigationView.loadViewFromNib()
    
    /// 标题和内容
    private var pageTitleView: SGPageTitleView?
    
    private var pageContentScrollerView : SGPageContentScrollView?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        UIApplication.shared.keyWindow?.theme_backgroundColor = "colors.windowColor"
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.titleView = navigationBar
        
        setupUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}


extension GanioTodayViewController
{
    private func setupUI()  {
        
        NetWorkUtil.loadTodayData { (result) in
            let configuration = SGPageTitleViewConfigure()
            configuration.titleColor = .black
            configuration.titleSelectedColor = UIColor.red
            configuration.indicatorColor = .clear
            
            // 标题名称的数组
            let titles = result.category
            self.pageTitleView = SGPageTitleView(frame: CGRect(x: 0, y: 55, width: kScreenWidth , height: 60), delegate: self, titleNames: titles, configure: configuration)
            self.pageTitleView!.backgroundColor = .clear
            self.view.addSubview(self.pageTitleView!)
           
            
            _ = titles?.compactMap({ (newTitle) -> () in
                let dic :Dictionary =  result.results
                let data = dic[newTitle]
                switch newTitle{
                    case "Android":
                        let androidController : GanIoViewController = GanIoViewController()
                        androidController.datas = data!
                        self.addChildViewController(androidController)
                    case  "拓展资源":
                        let kuozhanController : GanIoViewController = GanIoViewController()
                        kuozhanController.datas = data!
                        self.addChildViewController(kuozhanController)
                    case  "APP":
                        let appController : GanIoViewController = GanIoViewController()
                        appController.datas = data!
                        self.addChildViewController(appController)
                    case  "瞎推荐":
                        let xiaController : GanIoViewController = GanIoViewController()
                        xiaController.datas = data!
                        self.addChildViewController(xiaController)
                    case  "iOS":
                        let iosController : GanIoViewController = GanIoViewController()
                        iosController.datas = data!
                        self.addChildViewController(iosController)
                    case  "休息视频":
                        let xiuxiController : GanIoViewController = GanIoViewController()
                        xiuxiController.datas = data!
                        self.addChildViewController(xiuxiController)
                    case  "福利":
                        let fuliController : GanIoViewController = GanIoViewController()
                        fuliController.datas = data!
                        self.addChildViewController(fuliController)
                    default:
                        let androidController1 : GanIoViewController = GanIoViewController()
                        androidController1.datas = data!
                        self.addChildViewController(androidController1)
                }
            })
            
            self.pageContentScrollerView = SGPageContentScrollView(frame: CGRect(x: 0, y: 115, width: kScreenWidth, height: self.view.height - 165), parentVC: self, childVCs: self.childViewControllers)
            self.pageContentScrollerView?.delegatePageContentScrollView = self
            self.view.addSubview(self.pageContentScrollerView!)
            
            
        }

    }
}


// MARK: - SGPageTitleViewDelegate
extension GanioTodayViewController: SGPageTitleViewDelegate, SGPageContentScrollViewDelegate {
    /// 联动 pageContent 的方法
    func pageTitleView(_ pageTitleView: SGPageTitleView!, selectedIndex: Int) {
        self.pageContentScrollerView!.setPageContentScrollViewCurrentIndex(selectedIndex)
    }
    
    func pageContentScrollView(_ pageContentScrollView: SGPageContentScrollView!, progress: CGFloat, originalIndex: Int, targetIndex: Int) {
        self.pageTitleView?.setPageTitleViewWithProgress(progress, originalIndex: originalIndex, targetIndex: targetIndex)
    }
    
}
