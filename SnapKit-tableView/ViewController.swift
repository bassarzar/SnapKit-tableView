import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let nameLabel = UILabel()
    let imageView = UIImageView()

    var player = Player(name: "", image: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        configureView()
    }
    
    private func setupViews() {
        view.addSubview(imageView)
        view.addSubview(nameLabel)
        
        imageView.contentMode = .scaleAspectFit
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(view.safeAreaLayoutGuide).offset(40)
            make.width.height.equalTo(200)
        }
        
        nameLabel.font = .boldSystemFont(ofSize: 24)
        nameLabel.textAlignment = .center
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(20)
        }
    }
    
    private func configureView() {
        nameLabel.text = player.name
        imageView.image = UIImage(named: player.image)
    }
}
