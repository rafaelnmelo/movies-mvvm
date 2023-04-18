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
    
    public static func register() -> UINib {
        UINib(nibName: identifier, bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDate: UILabel!
    @IBOutlet weak var movieRate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.setupUi()
    }
}

//MARK: - FUNCTIONS -
extension MainMovieCell {
    func setupUi() {
        backView.addBorder(color: .label, width: 1)
        backView.round()
        backView.backgroundColor = .lightGray
        moviePoster.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        self.movieTitle.text = viewModel.title
        self.movieDate.text = viewModel.date
        self.movieRate.text = viewModel.rating
        self.moviePoster.sd_setImage(with: viewModel.imageUrl)
    }
}
