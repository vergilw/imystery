//
//  PlaybookListCell.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/28.
//

import UIKit

class PlaybookListCell: UITableViewCell {

    lazy fileprivate var nameLabel: YYLabel = {
        let label = YYLabel(frame: CGRect(x: 16, y: 16, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.head.font.lineHeight))
        label.font = UIConstants.head.font
        label.textColor = UIConstants.head.color
        return label
    }()
    
    lazy fileprivate var authorLabel: YYLabel = {
        let height = 16+UIConstants.head.font.lineHeight+5
        
        let label = YYLabel(frame: CGRect(x: 16, y: height, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.subhead.font.lineHeight))
        label.font = UIConstants.body.font
        label.textColor = UIConstants.body.color
        return label
    }()
    
    lazy fileprivate var logicScoreLabel: YYLabel = {
        let height = 16+UIConstants.head.font.lineHeight+5+UIConstants.body.font.lineHeight+5
        
        let label = YYLabel(frame: CGRect(x: 16, y: height, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.body.font.lineHeight))
        label.font = UIConstants.body.font
        label.textColor = UIConstants.body.color
        return label
    }()
    
    lazy fileprivate var storyScoreLabel: YYLabel = {
        let height = 16+UIConstants.head.font.lineHeight+5+(UIConstants.body.font.lineHeight+5)*2
        
        let label = YYLabel(frame: CGRect(x: 16, y: height, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.body.font.lineHeight))
        label.font = UIConstants.body.font
        label.textColor = UIConstants.body.color
        return label
    }()
    
    lazy fileprivate var characterCountLabel: YYLabel = {
        let height = 16+UIConstants.head.font.lineHeight+5+(UIConstants.body.font.lineHeight+5)*3
        
        let label = YYLabel(frame: CGRect(x: 16, y: height, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.body.font.lineHeight))
        label.font = UIConstants.body.font
        label.textColor = UIConstants.body.color
        return label
    }()
    
    lazy fileprivate var platformsLabel: YYLabel = {
        let height = 16+UIConstants.head.font.lineHeight+5+(UIConstants.body.font.lineHeight+5)*4
        print(height + UIConstants.body.font.lineHeight + 16)
        let label = YYLabel(frame: CGRect(x: 16, y: height, width: UIScreen.main.bounds.size.width-16-16, height: UIConstants.body.font.lineHeight))
        label.font = UIConstants.body.font
        label.textColor = UIConstants.body.color
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(nameLabel, authorLabel, logicScoreLabel, storyScoreLabel, characterCountLabel, platformsLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func setup(model: PlaybookModel) {
        nameLabel.text = "剧本：" + (model.name ?? "")
        authorLabel.text = "作者：" + (model.author ?? "")
        logicScoreLabel.text = String(format: "推理性得分：%.1f分", (model.logicScore ?? 0))
        storyScoreLabel.text = String(format: "故事性得分：%.1f分", (model.storyScore ?? 0))
        characterCountLabel.text = String(format: "角色：%d人", (model.characterCount ?? 0))
        if let platforms = model.platforms {
            platformsLabel.text = "游戏平台：" + platforms.joined(separator: "，")
        }
    }
}
