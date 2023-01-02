//
//  VehicleListTableViewCell.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 20/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import UIKit

class VehicleListTableViewCell: UITableViewCell {

    @IBOutlet weak var vehicleImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var licensePlateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureWith(vehicle: Vehicle) {
        let viewModel = VehicleListCellViewModel(vehicle: vehicle)
        let model = viewModel.createListCellModel()
        
//        self.vehicleImageView.kf.setImage(with: model.imageURL, placeholder: model.placeholder)
        self.nameLabel.text = model.title
        self.modelLabel.text = model.model
        self.licensePlateLabel.text = model.licensePlace
    }
}
