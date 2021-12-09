//
//  MovieCell.swift
//  MyMovieChart
//
//  Created by 윤태민 on 12/9/21.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet var thumbnail: UIImageView!   // 썸네일
    @IBOutlet var title: UILabel!           // 제목
    @IBOutlet var desc: UILabel!            // 설명
    @IBOutlet var openDate: UILabel!        // 개봉일
    @IBOutlet var rating: UILabel!          // 평점
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
