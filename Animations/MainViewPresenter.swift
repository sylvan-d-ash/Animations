//
//  MainViewPresenter.swift
//  Animations
//
//  Created by Sylvan Ash on 16/09/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import Foundation


enum Scene {
    case simpleTextAnimation
}


protocol MainViewPresenterProtocol {
    var numberOfItems: Int { get }
    func viewDidLoad()
    func getValue(forRowAt index: Int) -> Scene
    func didSelect(rowAt index: Int)
}


class MainViewPresenter: MainViewPresenterProtocol {
    private var scenes: [Scene] = []
    var numberOfItems: Int { return self.scenes.count }

    func viewDidLoad() {
        self.scenes = [
            .simpleTextAnimation
        ]
    }

    func getValue(forRowAt index: Int) -> Scene {
        return self.scenes[index]
    }

    func didSelect(rowAt index: Int) {
        //
    }
}
