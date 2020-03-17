//
//    MainViewController.swift
//    RadioHermitage
//
//    Created by Artem Kovardin on 14.03.2020.
//    Copyright (c) 2020 Artem Kovardin. All rights reserved.
//

import UIKit

protocol MainDisplayLogic: class {
    func displayData(viewModel: Main.Model.ViewModel.ViewModelData)
}

class MainViewController: UIViewController, MainDisplayLogic {

    var interactor: MainBusinessLogic?
    var router: (NSObjectProtocol & MainRoutingLogic)?

    // MARK: Object lifecycle

    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported")
    }

    init() {
        super.init(nibName: nil, bundle: nil)
        setup()
    }

    var button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(NSLocalizedString("Play", tableName: "Main", comment: "main scene"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 32)

        button.addTarget(self, action: #selector(toggle), for: .touchUpInside)

        return button
    }()

    let image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false

        return image
    }()

    // MARK: Setup

    private func setup() {
        let viewController = self
        let interactor = MainInteractor()
        let presenter = MainPresenter()
        let router = MainRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
    }

    // MARK: View lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white

        setupViews()
    }

    func displayData(viewModel: Main.Model.ViewModel.ViewModelData) {
        switch viewModel {
        case .displayPlay(let image):
            button.setTitle(NSLocalizedString("Stop", tableName: "Main", comment: "main scene"), for: .normal)
            print(image)
            self.image.image = UIImage(named: image)
        case .displayStop:
            button.setTitle(NSLocalizedString("Play", tableName: "Main", comment: "main scene"), for: .normal)
            self.image.image = nil
        }
    }

    func setupViews() {
        view.addSubview(button)

        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -80),
            button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button.widthAnchor.constraint(equalToConstant: 200),
            button.heightAnchor.constraint(equalToConstant: 60),
        ])

        view.addSubview(image)

        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 100),
            image.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant:  50),
            image.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant:  -50),
            image.heightAnchor.constraint(equalTo: image.widthAnchor),
        ])
    }

    // MARK: Actions

    @objc func toggle() {
        interactor?.makeRequest(request: .toggle)
    }

    // MARK: Routing

}
