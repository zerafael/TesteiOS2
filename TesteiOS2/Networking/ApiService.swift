//
//  APIService.swift
//  TesteiOS2
//
//  Created by José Rafael Ferraz Pacheco on 27/01/20.
//  Copyright © 2020 José Rafael Ferraz Pacheco. All rights reserved.
//

import Foundation
import Alamofire

protocol ApiServiceProtocol {
    associatedtype T
    
    var baseUrl: String { get set }
    
    func fetch(completion: @escaping (Swift.Result<[String: T], Error>) -> Void)
}

class ApiService<T: Decodable>: ApiServiceProtocol {
    
    var baseUrl: String = ""
    
    func fetch(completion: @escaping (Swift.Result<[String: T], Error>) -> Void ) {
        Alamofire.request(baseUrl).responseJSON { (response) in

        guard response.result.isSuccess else {
//            completion(.failure(Error))
            print("Só erro")
            return
        }

        do {
            let data = try JSONDecoder().decode([String: T].self, from: response.data!)
                    
            completion(.success(data))
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print(context)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
    //            } catch {
    ////                completion(.failure(Error))
    //                print("Decodificação falhou")
    //            }
        }
    }
}
