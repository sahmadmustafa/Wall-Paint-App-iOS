//
//  VehiclesListViewModel.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 20/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

protocol VehicleListViewModelDelegate {
    func didLoadVehiclesList(result: Result<[Vehicle], ServiceError>)
    func isLoading(loading: Bool)
    func scrollTo(indexPath: IndexPath)
    func presentVehicleDetails(vehicle: Vehicle)
}

protocol VehicleListViewModelProtocol: VehicleFilterDelegate {
    var delegate: VehicleListViewModelDelegate? { get set }
    var vehicles: [Vehicle] { get set }
    var allVehicles: [Vehicle] { get set }
    var filter: VehicleFilter { get set }
    
    func requestVehicleList()
    func requestDetailsFor(vehicle: Vehicle)
}

class VehiclesListViewModel: VehicleListViewModelProtocol {
    var delegate: VehicleListViewModelDelegate?
    var vehicles: [Vehicle] = []
    var allVehicles: [Vehicle] = []
    var filter: VehicleFilter = VehicleFilter()
    
    let service: VehiclesService
    init(service: VehiclesService) {
        self.service = service
    }
    
    func requestVehicleList() {
        delegate?.isLoading(loading: true)
        service.requestVehiclesList { [weak self] (result) in
            switch result {
            case .success(let vehicles):
                self?.allVehicles = vehicles
                self?.applyVehicleFilter()
            
            case .failure:
                self?.delegate?.didLoadVehiclesList(result: result)
            }
        }
    }
    
    func requestDetailsFor(vehicle: Vehicle) {
        delegate?.presentVehicleDetails(vehicle: vehicle)
        
        guard let index = vehicles.firstIndex(where: { $0.id == vehicle.id }) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        delegate?.scrollTo(indexPath: indexPath)
    }
    
    func applyVehicleFilter() {
        var filterVehicles = allVehicles
            
        if let fuelLevel = filter.fuelLevel {
            filterVehicles = filterVehicles.filter { $0.fuelLevel >= fuelLevel }
        }
        if filter.fuelType.count > 0 {
            filterVehicles = filterVehicles.filter { filter.fuelType.contains($0.fuelType) }
        }
        if filter.transmission.count > 0 {
            filterVehicles = filterVehicles.filter { filter.transmission.contains($0.transmission) }
        }
        if filter.cleanliness.count > 0 {
            filterVehicles = filterVehicles.filter { filter.cleanliness.contains($0.innerCleanliness) }
        }
        self.vehicles = filterVehicles
        self.delegate?.didLoadVehiclesList(result: .success(filterVehicles))
        self.delegate?.isLoading(loading: false)
    }
}

extension VehiclesListViewModel {
    
    func vehicleFilter(_ vehicleFilter: VehiclesFilterViewController, didApplyFilter filter: VehicleFilter) {
        self.filter = filter
        applyVehicleFilter()
    }
    
}
