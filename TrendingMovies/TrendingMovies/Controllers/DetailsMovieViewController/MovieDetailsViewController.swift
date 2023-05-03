//
//  MovieDetailsViewController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import UIKit
import SDWebImage

//MARK: - CLASS -
class MovieDetailsViewController: UIViewController {

    lazy var backgroundImage: UIImageView = {
       let image = UIImageView()
        image.contentMode = .scaleToFill
        image.translatesAutoresizingMaskIntoConstraints = false
        image.alpha = 0.4
        return image
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLb, descLb])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var titleLb: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        label.textColor = .white
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    private lazy var descLb: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var viewModel: MovieDetailsViewModel?
    var coordinator: AppCoordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
    }
}

//MARK: - FUNCTIONS -
extension MovieDetailsViewController {
    func setupUI() {
        self.setupView()
        self.titleLb.text = viewModel?.movieTitle
        self.descLb.text = viewModel?.movieDescription
        self.backgroundImage.sd_setImage(with: viewModel?.movieImage)
    }
}

//MARK: - VIEWCODE PROTOCOL -
extension MovieDetailsViewController: ViewCodeProtocol {
    func buildHierarchy() {
        view.addSubview(backgroundImage)
        view.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10)
        ])
    }
    
    func applyAdditionalChanges() {
        coordinator?.navigationController.navigationBar.prefersLargeTitles = false
        title = "Detalhes"
    }
}
