//
//  MyTabViewController.swift
//  GanIoDemo
//
//  Created by soft on 20/8/18.
//  Copyright © 2018年 silvercrest. All rights reserved.
//

import UIKit

class MyTabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let tabbar = UITabBar.appearance()
        tabbar.theme_tintColor = "colors.tabbarTintColor"
        tabbar.theme_barTintColor = "colors.cellBackgroundColor"

        let ganhuoToday :UIViewController = GanioTodayViewController()
        addChildViewController(viewController: ganhuoToday,outTitle: "主页",imageName: "home")
        
        let xiandu:UIViewController = XianduViewController()
        addChildViewController(viewController: xiandu,outTitle: "闲读",imageName: "xiandu")
        
        let kumike:UIViewController = KumikeViewController()
        addChildViewController(viewController: kumike, outTitle: "酷米客", imageName: "xiandu")
        
        let my:UIViewController = MyViewController()
        addChildViewController(viewController: my,outTitle: "我的",imageName: "my")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    func addChildViewController(viewController:UIViewController,outTitle title:String,imageName:String)  {
        
        viewController.title = title
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = UIImage(named: imageName)
        viewController.tabBarItem.selectedImage = UIImage(named: imageName + "_press")
        addChildViewController(MyNavigationController(rootViewController: viewController))
    }
    


}
