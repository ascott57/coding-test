//
//  APIManager.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/21.
//
//  This class encapsulates API calls.  A more sophisticated implementation might have two layers; one to offer
//  GET, PUT, DELETE etc. calls with a parameter struct argument, and business-level API calls suc as this one
//  over that, but for a simple test app this will suffice.

import Foundation

class APIManager: NSObject {
    
    func getScore(success: @escaping (_ score: Int, _ minScore: Int, _ maxScore: Int) -> Void, failure: @escaping () -> Void) { 
        let url = URL(string: Constants.creditURL)!
        
        let task = URLSession.shared.creditReportTask(with: url) { creditReport, response, error in
            if let creditReport = creditReport {
                print(creditReport.creditReportInfo.score)
                success(creditReport.creditReportInfo.score, creditReport.creditReportInfo.minScoreValue, creditReport.creditReportInfo.maxScoreValue)
            } else {
                failure()
            }
        }
        
        task.resume()
        
    }

}
