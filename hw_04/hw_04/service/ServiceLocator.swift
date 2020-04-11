//
//  ServiceLocator.swift
//  hw_04
//
//  Created by Dmitry Dementyev on 11.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//
import Foundation

protocol ServiceProtocol {
    func getService<T>() -> T?
}

final class ServiceLocator: ServiceProtocol {
    public static let shared = ServiceLocator()
    
    private lazy var services: Dictionary<String, Any> = [:]
    
    private func typeName(some: Any) -> String {
        return (some is Any.Type) ? "\(some)" : "\(type(of: some))"
    }
    
    func addService<T>(service: T) {
        let key = typeName(some: T.self)
        services[key] = service
    }
    
    func getService<T>() -> T? {
        let key = typeName(some: T.self)
        return services[key] as? T
    }
}
