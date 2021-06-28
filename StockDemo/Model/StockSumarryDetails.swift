//
//  StockSumarryDetails.swift
//  StockDemo
//
//  Created by Sahid Reza on 27/06/21.
//

import Foundation

struct StockSumarryDetails: Codable {
    let finance: Finance
}

// MARK: - Finance
struct Finance: Codable {
    let result: [Result]
}

// MARK: - Result
struct Result: Codable {
    let count: Int
    let quotes: [Quote]
}

// MARK: - Quote
struct Quote: Codable {
    let language, region, quoteType: String
    let triggerable: Bool
    let quoteSourceName, marketState, shortName: String
    let sourceInterval: Int
    let exchangeTimezoneName, exchangeTimezoneShortName: String
    let gmtOffSetMilliseconds: Int
    let esgPopulated, tradeable: Bool
    let regularMarketPrice: Double
    let regularMarketTime: Int
    let regularMarketChange: Double
    let market: String
    let priceHint: Int
    let postMarketChangePercent: Double
    let postMarketTime: Int
    let postMarketPrice, postMarketChange, regularMarketChangePercent, regularMarketPreviousClose: Double
    let fullExchangeName, exchange: String
    let exchangeDataDelayedBy: Int
    let symbol: String
}
