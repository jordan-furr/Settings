//
//  SettingListTableViewController.swift
//  Settings
//
//  Created by Jordan Furr on 3/2/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

class SettingListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          // #warning Incomplete implementation, return the number of rows
          return SettingController.settings.count
      }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? SettingTableViewCell else { return UITableViewCell() }

          cell.updateView(with: SettingController.settings[indexPath.row])
        cell.delegate = self
              return cell
      }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
}

extension SettingListTableViewController: SettingTableViewCellDelegate {
    func settingSwitchTapped(for cell: SettingTableViewCell) {
        /// TBVC -> Model Controller to update the isOn -> cell update
        guard let index = tableView.indexPath(for: cell) else {return}
        let setting = SettingController.settings[index.row]
        SettingController.toggleIsON(for: setting)
        cell.updateView(with: setting)
    }
}
