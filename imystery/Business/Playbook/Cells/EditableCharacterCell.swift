//
//  EditableCharacterCell.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class EditableCharacterCell: UITableViewCell {

    lazy fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor("#333")
        return label
    }()
    
    lazy fileprivate var editBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIConstants.body.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitle("编辑", for: .normal)
        button.isHidden = true
        //        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
        //        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
    lazy fileprivate var deleteBtn: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIConstants.body.color, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
        button.setTitle("删除", for: .normal)
        button.isHidden = true
        //        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
        //        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
    lazy fileprivate var textView: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 14)
        textView.textColor = UIColor("#333")
        textView.returnKeyType = .done
        textView.layer.cornerRadius = 3
        //        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.gray.cgColor
        textView.textContainerInset = UIEdgeInsets.zero
        textView.textContainer.lineFragmentPadding = 0
        textView.textContainer.lineBreakMode = .byCharWrapping
        textView.isUserInteractionEnabled = false
        return textView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews([titleLabel, editBtn, deleteBtn, textView])
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(10)
            make.height.equalTo(17)
        }
        
        deleteBtn.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.centerY.equalTo(titleLabel)
            make.height.equalTo(30)
        }
        
        editBtn.snp.makeConstraints { make in
            make.trailing.equalTo(deleteBtn.snp.leading).offset(-16)
            make.centerY.equalTo(titleLabel)
            make.height.equalTo(30)
        }
        
        textView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(titleLabel.snp.bottom).offset(5)
            make.width.equalTo(UIScreen.main.bounds.size.width-32)
            make.height.equalTo(50)
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
            deleteBtn.isHidden = false
            editBtn.isHidden = false
        } else {
            deleteBtn.isHidden = true
            editBtn.isHidden = true
        }
    }

    func setup(characterModel: CharacterModel) {
        titleLabel.text = characterModel.name
        textView.text = characterModel.brief
    }
}
