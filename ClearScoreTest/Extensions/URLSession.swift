//
//  URLSession.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/22.
//
//  These extensions simplify the use of URLSession to retrieve JSON a little bit.

import Foundation

extension URLSession {
    
    fileprivate func codableTask<T: Codable>(with url: URL, completionHandler: @escaping (T?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completionHandler(nil, response, error)
                return
            }
            completionHandler(try? JSONDecoder().decode(T.self, from: data), response, nil)
        }
    }

    func creditReportTask(with url: URL, completionHandler: @escaping (CreditReport?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
        return self.codableTask(with: url, completionHandler: completionHandler)
    }
    
}
