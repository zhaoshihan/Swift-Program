//
//  ViewController.swift
//  Triangle
//
//  Created by 赵世晗 on 2019/3/27.
//  Copyright © 2019 赵世晗. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        // super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let triangle = MyTriangle(frame:CGRect(x:0, y:0, width:view.frame.width, height:view.frame.height))
        triangle.backgroundColor = UIColor.clear
        self.view.addSubview(triangle)
    }
}

class MyTriangle:UIView{
    override func draw(_ rect: CGRect) {
        let path = UIBezierPath()
        path.move(to: CGPoint(x:bounds.midX, y:1/2 * bounds.midY))
        path.addLine(to:CGPoint(x: bounds.maxX - 10, y: 2/3 * bounds.maxY))
        path.addLine(to:CGPoint(x: bounds.minX + 10, y: 2/3 * bounds.maxY))
        path.close()
        
        UIColor.green.setFill()
        UIColor.red.setStroke()
        path.lineWidth = 3.0
        
        path.fill()
        path.stroke()
    }
}

