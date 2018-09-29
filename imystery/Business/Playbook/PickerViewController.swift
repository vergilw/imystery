//
//  PickerViewController.swift
//  imystery
//
//  Created by Vergil.Wang on 2018/9/29.
//

import UIKit

enum PlaybookPickerMode {
    case author
    case studio
    case platform
    case gender
}

class PickerViewController: BaseViewController {
    
    lazy var viewModel = PickerViewModel()
    
    convenience init(mode: PlaybookPickerMode) {
        self.init()
        
        viewModel.pickerMode = mode
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initContentView()
        initConstraints()
        addNotificationObservers()
    }
    
    // MARK: - ============= Initialize View =============
    func initContentView() {
        
    }
    
    // MARK: - ============= Constraints =============
    func initConstraints() {
        
    }
    
    // MARK: - ============= Notification =============
    func addNotificationObservers() {
        
    }
    
    // MARK: - ============= Request =============
    
    // MARK: - ============= Reload =============
    @objc func reload() {
        tableView.reloadData()
    }
    
    // MARK: - ============= Action =============
}

extension PickerViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let pickerMode = viewModel.pickerMode else { return 0 }
        switch pickerMode {
        case .author:
            return viewModel.authors.count
        case .studio:
            return viewModel.studios.count
        case .platform:
            return viewModel.platforms.count
        case .gender:
            return viewModel.genders.count
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let pickerMode = viewModel.pickerMode else { return UITableViewCell() }
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellID")
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CellID")
        }
        switch pickerMode {
        case .author:
            cell?.textLabel?.text = viewModel.authors[indexPath.row].name
        case .studio:
            cell?.textLabel?.text = viewModel.studios[indexPath.row].name
        case .platform:
            cell?.textLabel?.text = viewModel.platforms[indexPath.row].name
        case .gender:
            cell?.textLabel?.text = viewModel.genders[indexPath.row]
        }
        
        return cell!
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
