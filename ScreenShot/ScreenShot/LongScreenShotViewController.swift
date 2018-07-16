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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "screenshot")
    }
    
    @IBAction func getScreenShot(_ sender: Any) {
        let size = self.tableView.contentSize
        let renderer = UIGraphicsImageRenderer(bounds: CGRect(x: 0, y: 0, width: size.width, height: size.height))
        let image = renderer.image { context in
            self.tableView.layer.render(in: context.cgContext)
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func testLongShot() -> UIImage {
        
        view.snapshotView(afterScreenUpdates: <#T##Bool#>)
        return UIImage()
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
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
