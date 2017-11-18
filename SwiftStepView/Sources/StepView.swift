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

    @IBInspectable public var numberOfSteps: Int = 3 { didSet { setNeedsDisplay() } }
    @IBInspectable public var currentNumber: Int = 3 {
        didSet {
            if (currentNumber < 1) { currentNumber = 1; return }
            if (currentNumber > numberOfSteps) { currentNumber = numberOfSteps; return }
            setNeedsDisplay()
        }
    }
    
    @IBInspectable public var pointRaidus: CGFloat = 4 { didSet { setNeedsDisplay() } }
    @IBInspectable public var lineWidth: CGFloat = 1 { didSet { setNeedsDisplay() } }
    @IBInspectable public var delt: CGFloat = 2 { didSet { setNeedsDisplay() } }
    
    @IBInspectable public var color: UIColor = .lightGray { didSet { setNeedsDisplay() } }
    @IBInspectable public var doingColor: UIColor = .blue { didSet { setNeedsDisplay() } }
    
    // MARK: - Drawing
    private var pointDiameter: CGFloat { return 2 * pointRaidus }
    private var halfOfHeight: CGFloat { return bounds.size.height / 2 }
    
    private var lineLength: CGFloat {
        return (bounds.size.width - CGFloat(numberOfSteps)*pointDiameter - CGFloat(numberOfSteps-1) * 2 * delt) / CGFloat(numberOfSteps - 1)
    }

    public override func draw(_ rect: CGRect) {
		drawPointsWith(count: numberOfSteps, color: color)
        drawLinesWith(count: numberOfSteps, color: color)
        
        drawPointsWith(count: currentNumber, color: doingColor)
        drawLinesWith(count: currentNumber, color: doingColor)
    }
    
    private func drawPointsWith(count: Int, color: UIColor) {
        let path = UIBezierPath()
        
        // draw points
        for i in 0 ..< count {
            var point: CGPoint = .zero
            point.x = pointRaidus + (lineLength + pointDiameter + delt * 2) * CGFloat(i)
            point.y = halfOfHeight
            
            path.addArc(withCenter: point, radius: pointRaidus, startAngle: 0, endAngle: CGFloat.pi*2, clockwise: true)
        }
        
        color.setStroke()
        color.setFill()
        
        path.fill()
    }
    
    private func drawLinesWith(count: Int, color: UIColor) {
        let path = UIBezierPath()
        path.lineWidth = lineWidth
        path.lineCapStyle = .round
        
        // draw line
        for i in 0 ..< (count - 1) {
            let start = CGPoint(x: (pointDiameter + delt) + (lineLength + pointDiameter + delt*2) * CGFloat(i), y: halfOfHeight)
            let end = CGPoint(x: (pointDiameter + lineLength + delt) + (lineLength + pointDiameter + delt*2) * CGFloat(i), y: halfOfHeight)
            
            path.move(to: start)
            path.addLine(to: end)
        }
        
        color.setStroke()
        color.setFill()
        
        path.stroke()
    }
}
