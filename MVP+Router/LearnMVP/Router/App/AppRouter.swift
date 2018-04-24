//
//  AppRouter.swift
//  LearnMVP
//
//  Created by 王雁 on 2018/4/24.
//  Copyright © 2018年 王雁. All rights reserved.
//

import UIKit

protocol AppRouter {
    func showRootVC(window: UIWindow?)
}

class AppRouterWithBookList: AppRouter {
    
    var vc: UIViewController = {
        
        let viewController = BookListViewController()
        let navigation = UINavigationController(rootViewController: viewController)

        return navigation
    }()
    
    func showRootVC(window: UIWindow?) {
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
    }
}
