//
//  NetworkURLSessionManager.swift
//  StarWarsExam
//
//  Created by Consultant on 11/23/22.
//

import Foundation

class NetworkURLSessionManager {
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        print("initiating session in session manager")
        self.session = session
    }
}

extension NetworkURLSessionManager {
    
    func fetchPageResult(with urlStr: String, completion: @escaping (Result<PageResult, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = self.session.dataTask(with: url) { data, response, error in
            
            if let err = error {
                completion(.failure(.serverError(err)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode){
                completion(.failure(.badStatusCode(httpResponse.statusCode)))
                return
            }
            
            
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            do {
                let pageResult = try JSONDecoder().decode(PageResult.self, from: data)
                completion(.success(pageResult))
            } catch {
                print(error)
                if let decodeError = error as? DecodingError {
                    completion(.failure(.decodeFailure(decodeError)))
                } else {
                    completion(.failure(.other(error)))
                }
            }
        }
        task.resume()
    }
    
    func fetchCharactersResult(with urlStr: String, completion: @escaping (Result<Person, NetworkError>) -> Void) {
        
        guard let url = URL(string: urlStr) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = self.session.dataTask(with: url) { data, response, error in
            
            if let err = error {
                completion(.failure(.serverError(err)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse, !(200..<300).contains(httpResponse.statusCode){
                completion(.failure(.badStatusCode(httpResponse.statusCode)))
                return
            }
            
            
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            do {
                let pageResult = try JSONDecoder().decode(Person.self, from: data)
                completion(.success(pageResult))
            } catch {
                print(error)
                if let decodeError = error as? DecodingError {
                    completion(.failure(.decodeFailure(decodeError)))
                } else {
                    completion(.failure(.other(error)))
                }
            }
        }
        task.resume()
    }
    
    
    func fetchRawData(with urlStr: String, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        guard let url = URL(string: urlStr) else {
            completion(.failure(.badURL))
            return
        }
        let task = self.session.dataTask(with: url) { data, response, error in
            
            if let err = error {
                completion(.failure(.serverError(err)))
                return
            }
            
            if let httpResponse = response as? HTTPURLResponse,
               !(200..<300).contains(httpResponse.statusCode) {
                completion(.failure(.badStatusCode(httpResponse.statusCode)))
                return
            }
            
            guard let data = data else {
                completion(.failure(.badData))
                return
            }
            
            completion(.success(data))
        }
        task.resume()
    }
}


