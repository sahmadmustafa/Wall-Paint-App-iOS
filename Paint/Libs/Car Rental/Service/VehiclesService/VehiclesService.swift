//
//  VehiclesService.swift
//  Car Rental
//
//  Created by Clineu Iansen Junior on 19/09/19.
//  Copyright © 2019 Clineu Iansen Junior. All rights reserved.
//

import Foundation

protocol VehiclesService {
    
    func requestVehiclesList(completion: @escaping (Result<[Vehicle], ServiceError>) -> Void)
    
}

enum ServiceError: Error {
    case noConnection, timeout, invalidResponse, invalidURL, decodeError, apiError
}

extension ServiceError: LocalizedError {
    var localizedDescription: String {
        switch self {
        case .noConnection:
            return "service_error.no_connection".localizable
        case .timeout:
            return "service_error.timeout".localizable
        case .invalidResponse:
            return "service_error.invalid_response".localizable
        case .invalidURL:
            return "service_error.invalid_url".localizable
        case .decodeError:
            return "service_error.decode_error".localizable
        case .apiError:
            return "service_error.api_error".localizable
        }
    }
}
