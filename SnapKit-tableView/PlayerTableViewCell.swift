import UIKit
import SnapKit

class PlayerTableViewCell: UITableViewCell {
    
    let nameLabel = UILabel()
    let playerImageView = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(playerImageView)
        contentView.addSubview(nameLabel)
        
        playerImageView.contentMode = .scaleAspectFill
        playerImageView.clipsToBounds = true
        playerImageView.layer.cornerRadius = 35

        playerImageView.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(70)
        }

        nameLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(playerImageView.snp.right).offset(15)
            make.right.equalToSuperview().offset(-15)
        }
    }
    
    func configure(with player: Player) {
        nameLabel.text = player.name
        playerImageView.image = UIImage(named: player.image)
    }
}
