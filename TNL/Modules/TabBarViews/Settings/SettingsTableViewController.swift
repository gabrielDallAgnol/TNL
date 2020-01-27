//
//  SettingsTableViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 27/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
   
  private var viewModel = SettingsViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsSelection = true
    tableView.separatorStyle = .none
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600
    self.navigationController?.navigationBar.barStyle = .black
    
    
  }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return viewModel.numberOfRowsInSection()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      let cell = UITableViewCell()

      cell.selectionStyle = .none
      cell.textLabel?.text = viewModel.titleForIndexPath(indexPath: indexPath)
      cell.textLabel?.font = UIFont.systemFont(ofSize: 20.0, weight: .regular)
      cell.textLabel?.textColor = .brownishGrey
      cell.imageView?.image = viewModel.imageForIndexPath(indexPath: indexPath)

      return cell
    }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 70
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    switch viewModel.titleForIndexPath(indexPath: indexPath) {
    case "Profile":
      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Ops..."
      viewController.descriptionInfo = "Unfortunately this feature is not available yet."
      viewController.titleButton = "Ok!"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
    case "Push Notifications":
      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Ops..."
      viewController.descriptionInfo = "Unfortunately this feature is not available yet."
      viewController.titleButton = "Ok!"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
    case "Submit Feedback":
      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Ops..."
      viewController.descriptionInfo = "Unfortunately this feature is not available yet."
      viewController.titleButton = "Ok!"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
    case "Terms of Use":
      let viewController = SimpleNotificationViewController()
      viewController.titleModal = "Ops..."
      viewController.descriptionInfo = "Unfortunately this feature is not available yet."
      viewController.titleButton = "Ok!"
      viewController.modalPresentationStyle = .overCurrentContext
      present(viewController, animated: false, completion: nil)
    case "Log out":
      let storyboard = UIStoryboard(name: "Landing", bundle: nil)
      let controller = storyboard.instantiateInitialViewController()!
      controller.modalPresentationStyle = .fullScreen
      self.present(controller, animated: true, completion: nil)
    default: break
    }
  }
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))
    
    let label = UILabel()
    label.frame = CGRect.init(x: 20, y: 24, width: headerView.frame.width-10, height: headerView.frame.height)
    label.text = "Settings"
    label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
    label.textColor = UIColor.black // my custom colour
    
    headerView.addSubview(label)
    
    return headerView
  }
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 80
  }
}
