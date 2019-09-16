//
//  ViewController.swift
//  Animations
//
//  Created by Sylvan Ash on 16/09/2019.
//  Copyright © 2019 Sylvan Ash. All rights reserved.
//

import UIKit


class ViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView!
    var presenter: MainViewPresenterProtocol!


    override func viewDidLoad() {
        super.viewDidLoad()

        // tableview
        self.tableView.delegate = self
        self.tableView.dataSource = self

        // presenter
        self.presenter = MainViewPresenter(router: self)
        self.presenter.viewDidLoad()
    }

}


extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter.numberOfItems
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let scene = self.presenter.getValue(forRowAt: indexPath.row)
        cell.textLabel?.text = scene.title

        return cell
    }
}


extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter.didSelect(rowAt: indexPath.row)
    }
}


extension ViewController: MainViewRouterProtocol {
    func transition(to scene: Scene) {

        var viewController: UIViewController

        switch scene {
        case .simpleTextAnimation:
            viewController = SimpleTextAnimationViewController.initFromStoryboard()
        }

        self.navigationController?.pushViewController(viewController, animated: true)
    }
}


private extension Scene {
    var title: String {
        switch self {
        case .simpleTextAnimation: return NSLocalizedString("Simple Text Animation", comment: "simple text animation")
        }
    }
}
