//
//  HomeViewController.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

class HomeViewController: BaseViewController {

    lazy var viewModel = HomeViewModel()
    
    lazy fileprivate var playbookLibraryBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIConstants.primary.color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIConstants.body.font
        button.setTitle("剧本库", for: .normal)
        button.layer.cornerRadius = 6

//        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
//        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
    lazy fileprivate var playbookRecommendBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIConstants.primary.color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIConstants.body.font
        button.setTitle("十大剧本", for: .normal)
        button.layer.cornerRadius = 6
//        button.layer.borderWidth = 1
//        button.layer.borderColor = UIColor("#333").cgColor
//        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
//        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
    lazy fileprivate var playbookReportBtn: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIConstants.primary.color
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIConstants.body.font
        button.setTitle("侵权剧本", for: .normal)
        button.layer.cornerRadius = 6

//        button.setImage(UIImage(named: <#T##String#>)?.withRenderingMode(.alwaysTemplate), for: .normal)
//        button.addTarget(self, action: #selector(<#BtnAction#>), for: .touchUpInside)
        return button
    }()
    
//    lazy fileprivate var separatorImgView: UIImageView = {
//        let imgView = UIImageView()
//        imgView.backgroundColor = UIColor("#999")
//        return imgView
//    }()
    
    lazy var latestPlaybookLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.textColor = UIColor("#999")
        label.text = "- 看看有哪些新剧本 -"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "剧本杀小百科"
        
        initContentView()
        initConstraints()
        addNotificationObservers()
    }
    
    // MARK: - ============= Initialize View =============
    func initContentView() {
        //setup table view
        tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(refreshHeader))
        tableView.mj_footer = MJRefreshAutoNormalFooter(refreshingTarget: self, refreshingAction: #selector(refreshFooter))
        tableView.mj_footer.isHidden = true
        tableView.register(PlaybookListCell.self, forCellReuseIdentifier: PlaybookListCell.className())
        tableView.rowHeight = 176// UITableViewAutomaticDimension
        //        tableView.estimatedRowHeight = 90
        tableView.separatorStyle = .singleLine
        tableView.separatorInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        tableView.separatorColor = UIColor("#e8e8e8")
        tableView.backgroundColor = .white
        tableView.dataSource = self
        tableView.delegate = self
        
        initTableView()
        view.addSubviews(tableView)
    }
    
    func initTableView() {
        let headerView: UIView = {
            let view = UIView(frame: CGRect(origin: .zero, size: CGSize(width: UIScreen.main.bounds.size.width, height: 16+50+16+latestPlaybookLabel.font.lineHeight+10)))
            view.backgroundColor = .white
            return view
        }()
        
//        headerView.drawSeparator(startPoint: CGPoint(width:100, height:100))
//        headerView.drawSe
        headerView.addSubviews([playbookLibraryBtn, playbookRecommendBtn, playbookReportBtn, latestPlaybookLabel])
        tableView.tableHeaderView = headerView
    }
    
    // MARK: - ============= Constraints =============
    func initConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.top)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
        }
        
        playbookLibraryBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(50)
            make.leading.equalTo(16)
        }
        
        playbookRecommendBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(50)
            make.leading.equalTo(playbookLibraryBtn.snp.trailing).offset(16)
            make.width.equalTo(playbookLibraryBtn)
        }
        
        playbookReportBtn.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(16)
            make.height.equalTo(50)
            make.leading.equalTo(playbookRecommendBtn.snp.trailing).offset(16)
            make.trailing.equalToSuperview().offset(-16)
            make.width.equalTo(playbookRecommendBtn)
        }
        
//        separatorImgView.snp.makeConstraints { make in
//            make.leading.trailing.equalToSuperview()
//            make.top.equalTo(playbookReportBtn.snp.bottom).offset(16)
//            make.height.equalTo(0.5)
//        }
        
        latestPlaybookLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(playbookReportBtn.snp.top).offset(16+10)
        }
    }
    
    // MARK: - ============= Notification =============
    func addNotificationObservers() {
        
    }
    
    // MARK: - ============= Request =============
    
    // MARK: - ============= Reload =============
    @objc func reload() {
        tableView.reloadData()
    }
    
    @objc func refreshHeader() {
        viewModel.fetchPlaybooks { (bool) in
            self.tableView.mj_header.endRefreshing()
            self.reload()
        }
    }
    
    @objc func refreshFooter() {
        
    }
    
    // MARK: - ============= Action =============

}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel.playbookModels != nil) ? viewModel.playbookModels!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaybookListCell.className(), for: indexPath) as! PlaybookListCell
        cell.setup(model: viewModel.playbookModels![indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        //        if isFiltering() {
        //            let aModel = MailService.sharedInstance.searchedMailModels[indexPath.row]
        //            let viewController = MailDetailViewController(mailID: aModel.mailID)
        //            navigationController?.pushViewController(viewController, animated: true)
        //            return
        //        }
        //
        //        let aModel = MailService.sharedInstance.mailModels[indexPath.row]
        //        if let role = MailService.sharedInstance.selectedFolder?.role, role == FolderRole.drafts.rawValue {
        //            let viewController = WriteViewController()
        //            viewController.draftMail = aModel
        //            let navigationController = UINavigationController(rootViewController: viewController)
        //            navigationController.navigationBar.isTranslucent = false
        //            present(navigationController, animated: true, completion: nil)
        //        } else {
        //            let viewController = MailDetailViewController(mailID: aModel.mailID)
        //            navigationController?.pushViewController(viewController, animated: true)
        //        }
        
    }
}

