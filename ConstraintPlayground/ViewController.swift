//
//  ViewController.swift
//  ConstraintPlayground
//
//  Created by Damian Esteban on 11/13/15.
//  Copyright © 2015 Damian Esteban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // button and label
    let button1: UIButton = UIButton(type: .System)
    let button2: UIButton = UIButton(type: .System)
    let label1: UILabel = UILabel()
    let atRest = "I do nothing"
    let atWork = "I'm Superman!"
    
    // another button to trigger the segue
    let segueButton: UIButton = UIButton(type: .System)
    
    // A simple "toggle" method for our UIButton
    func buttonPressed() {
        if label1.text == atRest {
            label1.text = atWork
        } else {
            label1.text = atRest
        }
    }
    
    func segueButtonPressed() {
        performSegueWithIdentifier("showNeonViewController", sender: self)
    }
    
    func snapkitButtonPressed() {
        performSegueWithIdentifier("showSnapkitViewController", sender: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 1, alpha: 1)
        makeLayout()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func makeLayout() {
        // subviews
        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = UIColor.redColor()
        
        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = UIColor(red: 0.75, green: 0.75, blue: 0.1, alpha: 1)
        
        let view3 = UIView()
        view3.translatesAutoresizingMaskIntoConstraints = false
        view3.backgroundColor = UIColor(rgba: MaterialColors.Blue.P400.HUE)
        
        // label and button
        label1.text = atRest
        label1.translatesAutoresizingMaskIntoConstraints = false
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button1.setTitle("Platypus", forState: UIControlState.Normal)
        button1.addTarget(self, action: "buttonPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
        
        button1.backgroundColor = UIColor.blueColor()
        button1.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        segueButton.translatesAutoresizingMaskIntoConstraints = false
        segueButton.setTitle("Next", forState: UIControlState.Normal)
        segueButton.addTarget(self,
            action: "segueButtonPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
        segueButton.backgroundColor = UIColor(rgba: MaterialColors.Orange.P500.HUE)
        segueButton.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        button2.translatesAutoresizingMaskIntoConstraints = false
        button2.setTitle("SnapKit", forState: UIControlState.Normal)
        button2.addTarget(self, action: "snapkitButtonPressed",
            forControlEvents: UIControlEvents.TouchUpInside)
        button2.backgroundColor = UIColor(rgba: MaterialColors.Amber.P500.HUE)
        button2.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        
        view1.addSubview(segueButton)
        
        view2.addSubview(button1)
        view2.addSubview(label1)
        
        view3.addSubview(button2)
        
        view.addSubview(view1)
        view.addSubview(view2)
        view.addSubview(view3)
        
        // we add our views to a dictionary
        let viewsDictionary = [
            "view1": view1,
            "view2": view2,
            "view3": view3,
            "button1": button1,
            "label1": label1,
            "segueButton": segueButton,
            "button2": button2]
        
        // constraints for the subviews of our subviews (the buttons and the label)
        
        // In a vertical string, the beginning of the string is the top, the end is the bottom.
        // Translation: "view 1 is 36 points below the top of the superview, 8 points between view1 and view2
        // and no space between view2 and the bottom."
        //"V:|-36-[view1]-8-[view2]-0-|",
        //options: NSLayoutFormatOptions.AlignAllLeading,
        let segueButton_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[segueButton(>=60)]-|",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: nil,
            views: viewsDictionary)
        
        let segueButton_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[segueButton(>=30)]-10-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        view1.addConstraints(segueButton_constraint_H)
        view1.addConstraints(segueButton_constraint_V)
        
        let control_constraints_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[button1(>=80)]-20-[label1(>=100)]",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: nil,
            views: viewsDictionary)
        
        let control_constraints_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[button1]-40-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        view2.addConstraints(control_constraints_H)
        view2.addConstraints(control_constraints_V)
        
        let button2_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-10-[button2(>=50)]-10-|",
            options: NSLayoutFormatOptions.AlignAllCenterY,
            metrics: nil,
            views: viewsDictionary)
        
        let button3_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-10-[button2(>=30)]-10-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        view3.addConstraints(button2_constraint_H)
        view3.addConstraints(button3_constraint_V)
        
        // Metrics dictionary
        let metricsDictionary = [
            "view1Height": 50.0,
            "view2Height": 40.0,
            "view1and2Width": 100.0,
            "view3Width": 80,
            "view3Height": 80]
        
        // Sizing constraints.  The H is for horizontal, The V is for vertical.
        // These set the SIZE of the view.
        // view1
        let view1_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view1(view1and2Width)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        let view1_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[view1(view1Height)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        view1.addConstraints(view1_constraint_H)
        view1.addConstraints(view1_constraint_V)
        
        // view2
        let view2_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view2(view1and2Width)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        let view2_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[view2(>=view2Height)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        view2.addConstraints(view2_constraint_H)
        view2.addConstraints(view2_constraint_V)
        
        let view3_constraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view3(view3Width)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        let view3_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:[view3(view3Height)]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        view3.addConstraints(view3_constraint_H)
        view3.addConstraints(view3_constraint_V)
        
        // Positional Constraints.
        let view_contraint_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:|-[view2]",  // this sets the "standard width", the "edge" of the superview.
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        let view3_constraint_pos_H = NSLayoutConstraint.constraintsWithVisualFormat(
            "H:[view3]-|",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        let view3_constraint_pos_V = NSLayoutConstraint.constraintsWithVisualFormat(
            "V:|-66-[view3]",
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: metricsDictionary,
            views: viewsDictionary)
        
        let view_constraint_V = NSLayoutConstraint.constraintsWithVisualFormat(
            // In a vertical string, the beginning of the string is the top, the end is the bottom.
            // Translation: "view 1 is 36 points below the top of the superview, 8 points between view1 and view2
            // and no space between view2 and the bottom."
            "V:|-36-[view1]-8-[view2]-10-|",
            options: NSLayoutFormatOptions.AlignAllLeading,
            metrics: nil,
            views: viewsDictionary)
        
        // TODO: Add Anchor constraints
        
        view.addConstraints(view_contraint_H)
        view.addConstraints(view_constraint_V)
        view.addConstraints(view3_constraint_pos_H)
        view.addConstraints(view3_constraint_pos_V)
        
    }
}

