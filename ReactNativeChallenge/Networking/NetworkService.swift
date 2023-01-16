//
//  NetworkService.swift
//  ReactNativeChallenge
//
//  Created by Edzon Bolivar on 12/01/23.
//

import Alamofire
import Foundation

enum NetworkError: Error {
    case urlError
    case canNotParseData
    case serverError
}

public enum NetworkService {
    static func getAnime(completion: @escaping (_ result: Result<CategorySeriesModel, NetworkError>) -> ()) {
        AF.request(NetworkConstant.shared.getAnime, method: .get).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(CategorySeriesModel.self, from: data!)

                    completion(.success(jsonData))
                } catch {
                    completion(.failure(.canNotParseData))
                }
            case .failure:
                completion(.failure(.serverError))
            }
        }
    }

    static func getCategories(completion: @escaping (_ result: Result<CategoriesModelResponse, NetworkError>) -> ()) {
        AF.request(NetworkConstant.shared.getCategories, method: .get).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(CategoriesModelResponse.self, from: data!)

                    completion(.success(jsonData))
                } catch {
                    completion(.failure(.canNotParseData))
                }
            case .failure:
                completion(.failure(.serverError))
            }
        }
    }

    static func getSeriesByCategory(categoryURL: String, completion: @escaping (_ result: Result<CategorySeriesModel, NetworkError>) -> ()) {
        AF.request(categoryURL, method: .get).response { response in
            switch response.result {
            case .success(let data):
                do {
                    let jsonData = try JSONDecoder().decode(CategorySeriesModel.self, from: data!)

                    completion(.success(jsonData))
                } catch {
                    completion(.failure(.canNotParseData))
                }
            case .failure:
                completion(.failure(.serverError))
            }
        }
    }
}
