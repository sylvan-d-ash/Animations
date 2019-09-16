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

        // title
        self.title = NSLocalizedString("Simple Text Animation", comment: "Title for simple text animation view")

        // add gesture recognizer to initiate animation
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(self.didTapView)))
    }


    // MARK: - Animation

    private var hasAnimating: Bool = false

    @objc
    private func didTapView() {

        // don't do anything if already animated
        if self.hasAnimating { return }

        // mark that we're animating
        self.hasAnimating = true

        // animate title label
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            // move label to the left
            self.titleLabel.transform = CGAffineTransform(translationX: -30, y: 0)

        }) { (_) in

            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                // make label invisible
                self.titleLabel.alpha = 0

                // move label to the top and out of screen
                self.titleLabel.transform = self.titleLabel.transform.translatedBy(x: 0, y: -self.view.frame.height)
            })
        }

        // animate description label with a slight delay
        UIView.animate(withDuration: 0.5, delay: 0.2, usingSpringWithDamping: 0.5, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            // move label to the left
            self.descriptionLabel.transform = CGAffineTransform(translationX: -30, y: 0)

        }) { (_) in

            UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                // make label invisible
                self.descriptionLabel.alpha = 0

                // move label to the top and out of screen
                self.descriptionLabel.transform = self.descriptionLabel.transform.translatedBy(x: 0, y: -self.view.frame.height)
            })
        }
    }

}
