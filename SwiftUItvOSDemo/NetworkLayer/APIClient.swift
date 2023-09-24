//
//  APIClient.swift
//  SwiftUItvOSDemo
//
//  Created by Yogendra Singh on 24/09/23.
//

import Foundation
import Combine

protocol APIClient {
    associatedtype EndpointType: APIEndpoint
    func request<T: Decodable>(_ endpoint: EndpointType) -> AnyPublisher<T, Error>
}
