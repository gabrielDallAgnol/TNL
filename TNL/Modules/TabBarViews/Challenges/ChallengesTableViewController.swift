//
//  ChallengesTableViewController.swift
//  TNL
//
//  Created by Gabriel Schmit Dall Agnol on 25/01/20.
//  Copyright © 2020 Gabriel Schmit Dall Agnol. All rights reserved.
//

import UIKit

class ChallengesTableViewController: UITableViewController {
  
  let viewModel: ChallengesTableViewModel
  
  
  init(viewModel: ChallengesTableViewModel) {
      self.viewModel = viewModel
      super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder aDecoder: NSCoder) {
      fatalError("\(#file) \(#function) not implemented")
  }
  
  override func viewWillAppear(_ animated: Bool) {
    navigationController?.navigationBar.barStyle = .default
    self.navigationController?.navigationBar.isHidden = true
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.delegate = self
    tableView.dataSource = self
    tableView.allowsSelection = false
    tableView.separatorStyle = .none
    tableView.register(UINib(nibName: "ChallengeTableViewCell", bundle: nil), forCellReuseIdentifier: "ChallengeTableViewCell")
    tableView.rowHeight = UITableView.automaticDimension
    tableView.estimatedRowHeight = 600
    self.navigationController?.navigationBar.barStyle = .black
  }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
      return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return viewModel.numberOfRowsInSection()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChallengeTableViewCell", for: indexPath) as! ChallengeTableViewCell

        cell.setupCell(for: viewModel.challengeForIndexPath(indexPath: indexPath))
        cell.indexPath = indexPath
      
        return cell
  }
  override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
      let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

      let label = UILabel()
      label.frame = CGRect.init(x: 20, y: 24, width: headerView.frame.width-10, height: headerView.frame.height)
      label.text = "Today"
      label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
      label.textColor = UIColor.black // my custom colour

      headerView.addSubview(label)

      return headerView
  }
  override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
      return 80
  }
  
}
