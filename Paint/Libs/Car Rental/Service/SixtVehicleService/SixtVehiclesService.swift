//
//  SixtVehiclesService.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 19/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

class SixtVehiclesService: VehiclesService {
    private let vehiclesURL = URL(string: "https://cdn.sixt.io/codingtask/cars")
    private let session = URLSession.shared
    
    func requestVehiclesList(completion: @escaping (Result<[Vehicle], ServiceError>) -> Void) {
        guard let url = vehiclesURL else {
            completion(.failure(.invalidURL))
            return
        }
        
        session
            .decodableTask(with: url, completion: completion)
            .resume()
    }
    
}

