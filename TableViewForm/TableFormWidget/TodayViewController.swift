//
//  TodayViewController.swift
//  TableFormWidget
//
//  Created by kede on 2018/7/23.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit
import NotificationCenter

class TodayViewController: UIViewController, NCWidgetProviding {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view from its nib.
    
        // 设置Widget视图大小
        self.preferredContentSize = CGSize(width: UIScreen.main.bounds.width, height: 100)
//        self.view.backgroundColor = .cyan
        
        self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        
        // NSUserDefault 或 NSFileManager 来处理
        
    }
    
    // 获取数据更新界面
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
    @IBAction func presentAlert(_ sender: Any) {
//        print("click alert")
//        let alert = UIAlertController(title: "提示", message: "打开App", preferredStyle: .alert)
//        alert.addAction(UIAlertAction(title: "", style: .default, handler: { (action) in
//
//        }))
//        self.present(alert, animated: true, completion: nil)
        
        // 启动app
        self.extensionContext?.open(URL(string: "tableFormWidget://alert")!, completionHandler: nil)
    }
}

extension TodayViewController {
    
    // - 点击widget右侧展开折叠按钮时调用 iOS10.0后生效
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        let width = UIScreen.main.bounds.width
        var size = CGSize.zero
        switch activeDisplayMode {
        case .expanded:
           size = CGSize(width: width, height: 150)
        case .compact:
            size = CGSize(width: width, height: 100)
        }
        self.preferredContentSize = size
    }
}
