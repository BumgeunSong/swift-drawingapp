//
//  MyPoint.swift
//  DrawingApp
//
//  Created by juntaek.oh on 2022/03/02.
//

import Foundation

struct MyPoint{
    let x: Double
    let y: Double
    
    func xValue() -> Double{
        return self.x
    }
    
    func yValue() -> Double{
        return self.y
    }
    
    init(x: Double, y: Double){
        self.x = x
        self.y = y
    }
}