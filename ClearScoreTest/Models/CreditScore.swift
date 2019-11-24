//
//  CreditScore.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/21.
//
//  Interpret the JSON returned from the call; only need a couple of fields decode, but for futures...
//
//  Null values decode as nil optionals, using Int? as the type (assumption).

import Foundation

// MARK: - CreditReport from JSON
    struct CreditReport: Codable {
        let accountIDVStatus: String
        let creditReportInfo: CreditReportInfo
        let dashboardStatus, personaType: String
        let coachingSummary: CoachingSummary
        let augmentedCreditScore: Int? // "<null>"
}

// MARK: - CoachingSummary from JSON
    struct CoachingSummary: Codable {
        let activeTodo, activeChat: Bool
        let numberOfTodoItems, numberOfCompletedTodoItems: Int
        let selected: Bool
    }

// MARK: - CreditReportInfo from JSON
    struct CreditReportInfo: Codable {
        let score, scoreBand: Int
        let clientRef, status: String
        let maxScoreValue, minScoreValue, monthsSinceLastDefaulted: Int
        let hasEverDefaulted: Bool
        let monthsSinceLastDelinquent: Int
        let hasEverBeenDelinquent: Bool
        let percentageCreditUsed, percentageCreditUsedDirectionFlag, changedScore, currentShortTermDebt: Int
        let currentShortTermNonPromotionalDebt, currentShortTermCreditLimit, currentShortTermCreditUtilisation, changeInShortTermDebt: Int
        let currentLongTermDebt, currentLongTermNonPromotionalDebt: Int
        let currentLongTermCreditLimit, currentLongTermCreditUtilisation: Int? // "<null>"
        let changeInLongTermDebt, numPositiveScoreFactors, numNegativeScoreFactors, equifaxScoreBand: Int
        let equifaxScoreBandDescription: String
        let daysUntilNextReport: Int
    }

