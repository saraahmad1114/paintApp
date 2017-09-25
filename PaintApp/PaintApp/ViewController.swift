//
//  ViewController.swift
//  PaintApp
//
//  Created by Flatiron School on 9/23/17.
//  Copyright © 2017 Flatiron School. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var drawingPad: UIImageView!
    
    var zeroPoint = CGPoint.zero
    
    var userTouched = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.userTouched = false 
        
        if let touch = touches.first{
            self.zeroPoint = touch.location(in: self.view)
        }
    }
    
    func drawOnDrawingPad (originalPoint: CGPoint, toPoint: CGPoint) {
        UIGraphicsBeginImageContext(self.view.frame.size)
        self.drawingPad.image?.draw(in: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        var context = UIGraphicsGetCurrentContext()
        
        context?.move(to: CGPoint(x: originalPoint.x, y: originalPoint.y))
        context?.addLine(to: CGPoint(x: toPoint.x, y: toPoint.y))
        
        context?.setBlendMode(CGBlendMode.normal)
        context?.setLineCap(CGLineCap.round)
        context?.setLineWidth(8)
        context?.setStrokeColor(UIColor.black.cgColor)
        context?.strokePath()
        
        self.drawingPad.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        self.userTouched = true
        
        if let touch = touches.first{
            var currentPoint = touch.location(in: self.view)
            
            drawOnDrawingPad(originalPoint: zeroPoint, toPoint: currentPoint)
            
            zeroPoint = currentPoint
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if self.userTouched == false {
            drawOnDrawingPad(originalPoint: zeroPoint, toPoint: zeroPoint)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

