import UIKit

final class NameTableViewCell: UITableViewCell {
    
   
    private lazy var wholeView = UIView()
    
    private lazy var imageIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25)
        return label
    }()
    
    private lazy var iconColor: UIColor = {
        let color = UIColor()
        return color
    }()
    
    private lazy var ellipsisIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(systemName: "ellipsis")
        imageView.tintColor = .gray
        return imageView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
   

    
    func configure(name: String, imageName: String, color: String) {
        switch color {
        case ".red":
            iconColor = .red
        case ".blue":
            iconColor = .blue
        case ".green":
            iconColor = .green
        case ".cyan":
            iconColor = .cyan
        case ".yellow":
            iconColor = .yellow
        case ".purple":
            iconColor = .purple
        case ".brown":
            iconColor = .brown
        case ".black":
            iconColor = .black
        default:
            iconColor = .blue
        }
       
        imageIcon.image = UIImage(systemName: imageName)?.withTintColor(iconColor).withRenderingMode(.alwaysOriginal)
        nameLabel.text = name
       
    }
    func configure2(name: String, imageName: String) {
        imageIcon.image = UIImage(systemName: imageName)?.withTintColor(.black).withRenderingMode(.alwaysOriginal)
        nameLabel.text = name
    }
    func configure3(name: String, imageName: String) {
        imageIcon.image = UIImage(systemName: imageName)?.withTintColor(.red).withRenderingMode(.alwaysOriginal)
        nameLabel.text = name
    }
}

//MARK: - Setup UI


private extension NameTableViewCell {
    
    func setupUI() {
        setupViews()
        setupConstraints()
    }
    
    func setupViews() {
        addSubview(wholeView)
        wholeView.addSubview(imageIcon)
        wholeView.addSubview(nameLabel)
        wholeView.addSubview(ellipsisIcon)
    }
    
    func setupConstraints() {
        wholeView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(10)
        }
        imageIcon.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.4)
            make.centerY.equalToSuperview()
        }
        nameLabel.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalTo(imageIcon.snp.trailing).offset(15)
            make.trailing.equalTo(ellipsisIcon.snp.leading)
        }
        ellipsisIcon.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.size.equalTo(self.snp.height).multipliedBy(0.3)
            make.centerY.equalToSuperview()
        }
    }
}
