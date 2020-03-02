//
//  SettingTableViewCell.swift
//  Settings
//
//  Created by Jordan Furr on 3/2/20.
//  Copyright © 2020 Karl Pfister. All rights reserved.
//

import UIKit

protocol SettingTableViewCellDelegate: class {
    func settingSwitchTapped(for cell: SettingTableViewCell)
}

class SettingTableViewCell: UITableViewCell {

    //MARK: - Properties
    weak var delegate: SettingTableViewCellDelegate?
    //MARK: - Actions
    
    @IBAction func switchTapped(_ sender: Any) {
        delegate?.settingSwitchTapped(for: self)
    }
    
    //MARK: - Outlets
    
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var labelText: UILabel!
    @IBOutlet weak var settingSwitch: UISwitch!
    
    //MARK: - Helper Methods
    func updateView(with setting: Setting) {
        iconView.image = setting.icon
        labelText.text = setting.name
        settingSwitch.isOn = setting.isOn
        backgroundColor = setting.isOn ? .cyan: .white
    }
    
    
}
