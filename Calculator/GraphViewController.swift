//
//  GraphViewController.swift
//  Calculator
//
//  Created by Martin Mandl on 23.02.15.
//  Copyright (c) 2015 m2m server software gmbh. All rights reserved.
//

import UIKit

class GraphViewController: UIViewController, GraphViewDataSource
{
    @IBOutlet weak var graphView: GraphView! {
        didSet {
            graphView.dataSource = self
            graphView.addGestureRecognizer(UIPinchGestureRecognizer(target: graphView, action: "zoom:"))
            graphView.addGestureRecognizer(UIPanGestureRecognizer(target: graphView, action: "move:"))
            var tap = UITapGestureRecognizer(target: graphView, action: "center:")
            tap.numberOfTapsRequired = 2
            graphView.addGestureRecognizer(tap)
        }
    }
    
    func y(x: CGFloat) -> CGFloat? {
        brain.variableValues["M"] = Double(x)
        if let y = brain.evaluate() {
            return CGFloat(y)
        }
        return nil
    }

    private var brain = CalculatorBrain()
    typealias PropertyList = AnyObject
    var program: PropertyList {
        get {
            return brain.program
        }
        set {
            brain.program = newValue
        }
    }
    
}
