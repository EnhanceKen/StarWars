//
//  StarwarsTableViewCell.swift
//  StarWarsExam
//
//  Created by Consultant on 11/23/22.
//

import UIKit

class StarwarsTableViewCell: UITableViewCell {
//MARK: CELLS
   
    lazy var characterImageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
       
        imageView.layer.cornerRadius = 93
        imageView.image = UIImage(named: "starwars" )
        return imageView
    }()
    
    lazy var characterNamelabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.backgroundColor = .systemRed
        label.numberOfLines = 0
        label.heightAnchor.constraint(equalToConstant: 38).isActive = true
//        label.setTextAlignment:UITextAlignmentCenter]
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "Chubaka Not nice"
   

        return label
    }()
    
    lazy var eyecolorLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
//        label.lineBreakMode = .byTruncatingTail
        label.backgroundColor = .systemBlue
        label.heightAnchor.constraint(equalToConstant: 28).isActive = true
        label.textColor = .black
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "Darth"
     

        return label
    }()
    
    lazy var hairColorlabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.backgroundColor = .systemGreen
        label.numberOfLines = 0
        label.heightAnchor.constraint(equalToConstant: 38).isActive = true
//        label.setTextAlignment:UITextAlignmentCenter]
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "Lukes Father"
   

        return label
    }()
    
    lazy var homeworldlabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints =  false
        label.backgroundColor = .systemPurple
        label.numberOfLines = 0
        label.heightAnchor.constraint(equalToConstant: 38).isActive = true
//        label.setTextAlignment:UITextAlignmentCenter]
        label.textAlignment = .center
        label.layer.masksToBounds = true
        label.layer.cornerRadius = 5
        label.text = "Han solo"
   

        return label
    }()
    
        override init(style: UITableViewCell.CellStyle,reuseIdentifier: String?) {
            super.init(style: style, reuseIdentifier: reuseIdentifier)
            self.setUpUI()
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
   
    func setUpUI() {
        self.contentView.backgroundColor = .purple
        self.contentView.addSubview(self.characterImageView)
        self.contentView.addSubview(self.characterNamelabel)
        self.contentView.addSubview(self.eyecolorLabel)
        
        
        //MARK: TEST
        
//        let bufferTop = UIView.createBufferView()
//        let bufferBottom = UIView.createBufferView()
        

        self.characterImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.characterImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.characterImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -5).isActive = true
        self.characterImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.characterImageView.widthAnchor.constraint(equalToConstant: 125).isActive = true

        self.characterNamelabel.leadingAnchor.constraint(equalTo: self.characterImageView.trailingAnchor, constant: 8).isActive = true
        self.characterNamelabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        self.characterNamelabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: -25).isActive = true
        
        self.eyecolorLabel.leadingAnchor.constraint(equalTo: self.characterImageView.trailingAnchor, constant: 8).isActive = true
        self.eyecolorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        self.eyecolorLabel.topAnchor.constraint(equalTo: self.characterNamelabel.bottomAnchor, constant: 8).isActive = true
    }
    
    override func awakeFromNib() {
          super.awakeFromNib()
          // Initialization code
      }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
    
    
}
