//
//  EditableTextViewCell.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class EditableTextViewCell: UITableViewCell {

    lazy fileprivate var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor("#333")
        return label
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
        addSubviews([titleLabel, textView])
        initConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.top.equalTo(0)
            make.height.equalTo(44)
        }
        
        textView.snp.makeConstraints { make in
            make.leading.equalTo(16)
            make.trailing.equalTo(-16)
            make.top.equalTo(titleLabel.snp.bottom)
            make.width.equalTo(UIScreen.main.bounds.size.width-32)
            make.height.equalTo(70)
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
            textView.layer.borderWidth = 0.5
            textView.isUserInteractionEnabled = true
        } else {
            textView.layer.borderWidth = 0
            textView.isUserInteractionEnabled = false
        }
    }

    func setup(title: String, value: String?) {
        titleLabel.text = title
        textView.text = value
    }
}
