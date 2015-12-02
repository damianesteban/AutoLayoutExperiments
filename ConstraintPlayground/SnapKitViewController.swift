//
//  SnapKitViewController.swift
//  ConstraintPlayground
//
//  Created by Damian Esteban on 02/12/15.
//  Copyright © 2015 Damian Esteban. All rights reserved.
//

import UIKit
import SnapKit

class SnapKitViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()
        let containerView = UIView()
        containerView.backgroundColor = UIColor(rgba: MaterialColors.Blue.P400.HUE)
        
        let centerView = UIView()
        centerView.backgroundColor = UIColor(rgba: MaterialColors.Red.P200.HUE)

        view.addSubview(containerView)
        containerView.addSubview(centerView)
        
        containerView.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(view)
            make.left.equalTo(view)
            make.bottom.equalTo(view)
            make.right.equalTo(view)
        }
        
        centerView.snp_makeConstraints { (make) -> Void in
            make.size.equalTo(60)
            make.center.equalTo(containerView)
        }
        
                // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
