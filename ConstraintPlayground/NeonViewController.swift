//
//  NeonViewController.swift
//  ConstraintPlayground
//
//  Created by Damian Esteban on 11/13/15.
//  Copyright © 2015 Damian Esteban. All rights reserved.
//

import UIKit
import Neon

class NeonViewController: UIViewController {
    
    let containerView = UIView()
    let anchorView = UIView()
    
    let view1 = UIView()
    let view2 = UIView()
    let view3 = UIView()
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    let label1 = UILabel()
    let label2 = UILabel()
    let label3 = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(rgba: MaterialColors.DeepOrange.P500.HUE)
        
        containerView.backgroundColor = UIColor(rgba: MaterialColors.BlueGrey.P500.HUE)
        containerView.clipsToBounds = true
        view.addSubview(containerView)
        
        view1.backgroundColor = UIColor(rgba: MaterialColors.Green.P400.HUE)
        containerView.addSubview(view1)
        
        view2.backgroundColor = UIColor(rgba: MaterialColors.LightBlue.P400.HUE)
        containerView.addSubview(view2)
        
        view3.backgroundColor = UIColor(rgba: MaterialColors.Brown.P300.HUE)
        containerView.addSubview(view3)
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        containerView.fillSuperview(left: 20, right: 20, top: 20, bottom: 20)
        layoutFrames()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func layoutFrames() {
        view1.anchorAndFillEdge(.Top, xPad: 10, yPad: 10, otherSize: 60)
        view2.anchorInCenter(width: 40, height: 40)
        view3.anchorAndFillEdge(.Bottom, xPad: 10, yPad: 10, otherSize: 60)
        
    }
}

/*
// MARK: - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
// Get the new view controller using segue.destinationViewController.
// Pass the selected object to the new view controller.
}
*/
