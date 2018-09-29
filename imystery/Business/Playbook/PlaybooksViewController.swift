//
//  PlaybooksViewController.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/28.
//

import UIKit

class PlaybooksViewController: BaseViewController {

    lazy var viewModel = PlaybooksViewModel()
    
    lazy fileprivate var searchController: UISearchController = {
        $0.searchResultsUpdater = self
        $0.hidesNavigationBarDuringPresentation = false
        $0.dimsBackgroundDuringPresentation = false
//        $0.searchBar.isTranslucent = false
        //definesPresentationContext
        return $0
    }(UISearchController.init(searchResultsController: nil))
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        extendedLayoutIncludesOpaqueBars = true
        navigationItem.title = "找剧本"
        
        initContentView()
        initConstraints()
        addNotificationObservers()
    }
    
    // MARK: - ============= Initialize View =============
    func initContentView() {
        
        //setup search bar
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).font = UIFont.systemFont(ofSize: 14)
        UITextField.appearance(whenContainedInInstancesOf: [UISearchBar.self]).attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.foregroundColor: UIConstants.primary.color, .font: UIFont.systemFont(ofSize: 14)])
        searchController.searchBar.tintColor = UIColor("#cacaca")
        searchController.searchBar.setPositionAdjustment(UIOffset(horizontal: 5, vertical: 0), for: .search)
        searchController.searchBar.searchTextPositionAdjustment = UIOffset(horizontal: 3, vertical: 0)
        if #available(iOS 11.0, *) {
            navigationItem.searchController = searchController
            navigationItem.hidesSearchBarWhenScrolling = false
        } else {
            tableView.tableHeaderView = searchController.searchBar
        }
        
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
        
        view.addSubviews(tableView)
    }
    
    // MARK: - ============= Constraints =============
    func initConstraints() {
        tableView.snp.makeConstraints { (make) in
            make.top.equalTo(self.topLayoutGuide.snp.top)
            make.bottom.equalTo(self.bottomLayoutGuide.snp.top)
            make.leading.trailing.equalToSuperview()
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

extension PlaybooksViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering() {
            return (viewModel.searchedPlaybookModels != nil) ? viewModel.searchedPlaybookModels!.count : 0
        }
        return (viewModel.playbookModels != nil) ? viewModel.playbookModels!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PlaybookListCell.className(), for: indexPath) as! PlaybookListCell
        if isFiltering() {
            cell.setup(model: viewModel.searchedPlaybookModels![indexPath.row])
        } else {
            cell.setup(model: viewModel.playbookModels![indexPath.row])
        }
        
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

        let aModel = viewModel.playbookModels![indexPath.row]
        let viewController = PlaybookDetailViewController(playbookModel: aModel)
        navigationController?.pushViewController(viewController, animated: true)
        
    }
}

extension PlaybooksViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        if let text = searchController.searchBar.text, text.count > 0 {
            filterContentForSearchText(text)
        } else {
            reload()
        }
    }
    
    func isFiltering() -> Bool {
        return searchController.isActive && !searchBarIsEmpty()
    }
    
    func searchBarIsEmpty() -> Bool {
        // Returns true if the text is empty or nil
        return searchController.searchBar.text?.isEmpty ?? true
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
//        MailService.sharedInstance.searchMails(keywords: searchText)
        
        reload()
    }
}
