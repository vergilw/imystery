//
//  CharacterTitleCell.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class CharacterTitleCell: UITableViewCell {

    lazy fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor("#333")
        label.text = "角色介绍"
        return label
    }()
    
    lazy fileprivate var addBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIConstants.body.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitle("新增", for: .normal)
        button.isHidden = true
//        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
//        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews([titleLabel, addBtn])
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.centerY.equalToSuperview()
        }
        
        addBtn.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.centerY.equalTo(titleLabel)
            make.height.equalTo(30)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    override func setEditing(_ editing: Bool, animated: Bool) {
        if editing {
            addBtn.isHidden = false
        } else {
            addBtn.isHidden = true
        }
    }
}
