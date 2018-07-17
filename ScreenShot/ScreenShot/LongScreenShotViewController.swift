//
//  LongScreenShotViewController.swift
//  ScreenShot
//
//  Created by kede on 2018/7/16.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit

class LongScreenShotViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var toSuperBottomCst: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "screenshot")
    }
    
    @IBAction func getScreenShot(_ sender: Any) {
        let image = testLongShot()
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func testLongShot() -> UIImage {
        
        let snapshotView = view.snapshotView(afterScreenUpdates: false)
        
        if let snapshot = snapshotView {
            view.addSubview(snapshot)
        }
        
        let oldOffset = tableView.contentOffset
        tableView.contentOffset = .zero
        let contentSize = tableView.contentSize
        
        var navigationHeight: CGFloat = 0
        if (CGSize(width: 375, height: 812) == UIScreen.main.bounds.size || CGSize(width: 812, height: 375) == UIScreen.main.bounds.size) {
            navigationHeight = 88
        } else {
            navigationHeight = 64
        }
        
        let height = UIScreen.main.bounds.height - navigationHeight
        toSuperBottomCst.constant = height - contentSize.height
        
        let renderer = UIGraphicsImageRenderer(size: contentSize)
        let image = renderer.image { (context) in
            self.tableView.layer.render(in: context.cgContext)
        }
        tableView.contentOffset = oldOffset
        toSuperBottomCst.constant = 0
        
        snapshotView?.removeFromSuperview()
        
        return image
    }
    
    
    //MARK: - UITableViewDataSource && UITableViewDelegate
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "screenshot", for: indexPath)
        cell.textLabel?.text = "第\(indexPath.row)行"
        return cell
    }
    
}
