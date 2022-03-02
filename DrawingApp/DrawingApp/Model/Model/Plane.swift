//
//  Plane.swift
//  DrawingApp
//
//  Created by Bumgeun Song on 2022/03/02.
//

import Foundation

protocol PlaneDelegate {
    func didUpdateViewModel(_ plane: Plane)
}

class Plane {
    private var viewModels: [ViewModel] = [] {
        didSet {
            guard let newModel = viewModels.last else { return }
            Log.info("Added: \(newModel)")
        }
    }
    
    var selected: ViewModel?
    var delegate: PlaneDelegate?
    
    var rectangleCount: Int {
        viewModels.filter { $0 is Rectangle }.count
    }
    
    subscript(index: Int) -> ViewModel {
        return viewModels[index]
    }
    
    func setUpInitialModels() {
        for _ in 0..<4 {
            addRectangle()
        }
    }
    
    func addRectangle() {
        viewModels.append(Factory.createRectangle())
    }
    
    func tap(on point: Point) {
        let candidate = viewModels.filter { viewModel in
            viewModel.contains(point)
        }
        guard let selected = candidate.last else { return }
        self.selected = selected
    }
    
    func transform(to color: Color) {
        guard let mutableViewModel = selected as? ColorMutable else { return }
        mutableViewModel.transform(to: color)
    }
    
    func transform(to alpha: Alpha) {
        guard let mutableViewModel = selected as? AlphaMutable else { return }
        mutableViewModel.transform(to: alpha)
    }
}