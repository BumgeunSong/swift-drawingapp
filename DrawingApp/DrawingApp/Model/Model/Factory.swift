//
//  Factory.swift
//  DrawingApp
//
//  Created by Bumgeun Song on 2022/02/28.
//

import Foundation

class Factory {
    func createRandomRectangle() -> Rectangle? {
        let (width, height) = (Double(150), Double(120))
        let X = Double(Int.random(in: 10...500))
        let Y = Double(Int.random(in: 10...500))
        guard let color = Color(r: Int.random(in: 0...255),
                                g: Int.random(in: 0...255),
                                b: Int.random(in: 0...255),
                                a: Int.random(in: 0...10)) else {
            return nil
        }
        
        return Rectangle(width: width, height: height, positionX: X, positionY: Y, color: color)
    }
    
    func createRandomRectangles(number: Int) -> [Rectangle?] {
        return (0..<number).map { _ in createRandomRectangle() }
    }
}