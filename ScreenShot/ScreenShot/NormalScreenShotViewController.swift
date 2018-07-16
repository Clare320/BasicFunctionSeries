//
//  NormalScreenShotViewController.swift
//  ScreenShot
//
//  Created by kede on 2018/7/16.
//  Copyright © 2018年 Clare320. All rights reserved.
//

import UIKit

class NormalScreenShotViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    @IBAction func getScreenShot(_ sender: Any) {
        let renderer = UIGraphicsImageRenderer(bounds: view.bounds)
        let image = renderer.image { context in
            self.view.layer.render(in: context.cgContext)
        }
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ResultViewController") as! ResultViewController
        vc.image = image
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
