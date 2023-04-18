//
//  DetailsMovieViewController.swift
//  TrendingMovies
//
//  Created by Rafael Melo on 18/04/23.
//

import UIKit

class DetailsMovieViewController: UIViewController {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieDesc: UILabel!
    
    var viewModel: DetailsMovieViewModel
    
    init(viewModel: DetailsMovieViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DetailsMovieViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configView()
    }
    
    func configView() {
        self.title = "Detalhes"
        movieImage.sd_setImage(with: viewModel.movieImage)
        movieTitle.text = viewModel.movieTitle
        movieDesc.text = viewModel.movieDescription
    }

}
