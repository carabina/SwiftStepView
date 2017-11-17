//
//  StepView.swift
//  SwiftStepView
//
//  Created by Julie on 17/11/17.
//  Copyright © 2017 ZHOU DENGFENG DEREK. All rights reserved.
//

import UIKit

@IBDesignable
public class StepView: UIView {

    @IBInspectable public var count: Int = 3 { didSet { setNeedsDisplay() } }
    public private (set) var currentIndex: Int = 0
    
    @IBInspectable public var pointRaidus: CGFloat = 4 { didSet { setNeedsDisplay() } }
    @IBInspectable public var lineWidth: CGFloat = 1 { didSet { setNeedsDisplay() } }
    @IBInspectable public var delt: CGFloat = 2 { didSet { setNeedsDisplay() } }
    
    // MARK: - Drawing
    
    private var lineLength: CGFloat {
        return (bounds.size.width - 3 * 2 * pointRaidus - CGFloat(count - 1) * 2 * delt) / CGFloat(count - 1)
    }

    public override func draw(_ rect: CGRect) {
		drawPoints()
        drawLines()
    }
    
    private func drawPoints() {
        let path = UIBezierPath()
        
        // draw points
        for i in 0 ..< count {
            var point: CGPoint = .zero
            point.x = pointRaidus + (lineLength + pointRaidus * 2 + delt * 2) * CGFloat(i)
            point.y = bounds.size.height / 2
            
            path.addArc(withCenter: point, radius: pointRaidus, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        }
        
        UIColor.white.setStroke()
        UIColor.white.setFill()
        
        path.fill()
    }
    
    private func drawLines() {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        
        // draw line
        for i in 0 ..< (count - 1) {
            let start = CGPoint(x: (2*pointRaidus + delt) + (lineLength + 2*pointRaidus + delt*2) * CGFloat(i), y: bounds.size.height / 2)
            let end = CGPoint(x: (2*pointRaidus + lineLength + delt) + (lineLength + 2*pointRaidus + delt*2) * CGFloat(i), y: bounds.size.height / 2)
            
            path.move(to: start)
            path.addLine(to: end)
        }
        
        UIColor.white.setStroke()
        UIColor.white.setFill()
        
        path.stroke()
    }
}
