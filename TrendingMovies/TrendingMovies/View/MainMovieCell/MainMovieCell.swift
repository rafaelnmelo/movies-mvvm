//
//  MainMovieCell.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 17/04/23.
//

import UIKit
import SDWebImage

//MARK: - CLASS -
class MainMovieCell: UITableViewCell {

    public static var identifier: String {
        get {
            "MainMovieCell"
        }
    }
    
    private lazy var containerView: UIView = {
       let view = UIView()
        view.backgroundColor = .clear
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 20
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var blurView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let blurView = UIVisualEffectView(effect: blurEffect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        return blurView
    }()
    
    private lazy var poster: UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var title: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [rating, date])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var rating: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var date: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .white
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - FUNCTIONS -
extension MainMovieCell {
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.title.text = viewModel.title
        self.date.text = viewModel.date
        self.rating.text = viewModel.rating
        self.poster.sd_setImage(with: viewModel.imageUrl)
    }
}

//MARK: - VIEWCODE PROTOCOL -
extension MainMovieCell: ViewCodeProtocol {
    func buildHierarchy() {
        contentView.addSubview(containerView)
        containerView.addSubview(blurView)
        containerView.addSubview(poster)
        containerView.addSubview(title)
        containerView.addSubview(stackView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            blurView.topAnchor.constraint(equalTo: containerView.topAnchor),
            blurView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            blurView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            poster.topAnchor.constraint(equalTo: containerView.topAnchor),
            poster.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            poster.heightAnchor.constraint(equalTo: poster.widthAnchor, multiplier: 1.5),
            poster.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            title.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 8),
            title.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            title.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 8),
            
            stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -8),
            stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -8),
            stackView.leadingAnchor.constraint(equalTo: poster.trailingAnchor, constant: 8)
        ])
        
        let heightConstraint = containerView.heightAnchor.constraint(equalToConstant: 150)
        heightConstraint.isActive = true
        heightConstraint.priority = UILayoutPriority.init(999)
    }
    
    func applyAdditionalChanges() {
        contentView.backgroundColor = .clear
        backgroundColor = .clear
        selectionStyle = .none
    }
}
