//
//  SimpleTextAnimationViewController.swift
//  Animations
//
//  Created by Sylvan Ash on 16/09/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import UIKit


class SimpleTextAnimationViewController: UIViewController {

    // MARK: - Init


    static func initFromStoryboard() -> UIViewController {
        let storyboard = UIStoryboard(name: "SimpleTextAnimation", bundle: nil)
        return storyboard.instantiateInitialViewController() as! SimpleTextAnimationViewController
    }


    // MARK: - IBOutlets


    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!


    // MARK: - View Lifecycle


    override func viewDidLoad() {
        super.viewDidLoad()

        // add gesture recognizer to initiate animation
        self.view.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(didTapView)))
    }


    // MARK: - Animation


    @objc private func didTapView() {

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseIn, animations: {
            // move label to the left
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)

        }) { (_) in

            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
                // make label invisible
                self.titleLabel.alpha = 0

                // move label to the top and out of screen
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: self.view.frame.height)
            })
        }
    }

}
