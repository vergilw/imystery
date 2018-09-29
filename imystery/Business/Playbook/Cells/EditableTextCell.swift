//
//  EditableTextCell.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class EditableTextCell: UITableViewCell {

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor("#333")
        return label
    }()
    
    lazy fileprivate var textField: UITextField = {
        let textField = UITextField()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.textColor = UIColor("#333")
        textField.returnKeyType = .done
        textField.layer.cornerRadius = 3
//        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = UIColor.gray.cgColor
        let placeholderView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 5, height: 36)))
        placeholderView.isUserInteractionEnabled = false
        textField.rightView = placeholderView
        textField.rightViewMode = .always
        textField.textAlignment = .right
        textField.isUserInteractionEnabled = false
        return textField
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        selectionStyle = .none
        addSubviews([titleLabel, textField])
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
        
        textField.snp.makeConstraints { make in
            make.trailing.equalTo(-16)
            make.height.equalTo(36)
            make.width.equalTo(200)
            make.centerY.equalToSuperview()
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
            textField.layer.borderWidth = 0.5
            textField.isUserInteractionEnabled = true
        } else {
            textField.layer.borderWidth = 0
            textField.isUserInteractionEnabled = false
        }
    }

    func setup(title: String, value: Any?) {
        titleLabel.text = title
        if let value = value as? String {
            textField.text = value
        } else if let value = value as? Int {
            textField.text = String(value)
        } else if let value = value as? Float {
            textField.text = String(value)
        } else if let value = value as? Bool {
            if value {
                textField.text = "是"
            } else {
                textField.text = "否"
            }
        } else if let value = value as? [String] {
            textField.text = value.joined(separator: "，")
        }
        
    }
}
