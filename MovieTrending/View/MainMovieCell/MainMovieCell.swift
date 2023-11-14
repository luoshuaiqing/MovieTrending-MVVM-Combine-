//
//  MainMovieCell.swift
//  MovieTrending
//
//  Created by Shuaiqing Luo on 11/14/23.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {
    
    /// Note: This should be added to the identifier of the nib file as well.
    static var identifier: String {
        get {
            "MainMovieCellIdentifier"
        }
    }
    
    static func register() -> UINib {
        UINib(nibName: "MainMovieCell", bundle: nil)
    }
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var movieImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.addBorder(color: .label, width: 1)
        backView.round(10)
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel) {
        nameLabel.text = viewModel.title
        dateLabel.text = viewModel.date
        rateLabel.text = viewModel.rating
        movieImageView.sd_setImage(with: viewModel.imageUrl)
    }
    
}
