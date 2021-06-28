//
//  Constant.swift
//  StockDemo
//
//  Created by Sahid Reza on 27/06/21.
//

struct K {
    
    static let applicationName = "GROW INVESMENT"
    static let baseUrl = "https://apidojo-yahoo-finance-v1.p.rapidapi.com/"
    static let getMethod = "GET"
    
    struct SegueDetails {
        
        static let splashToStockConterller = "splashToStockConterller"
        
    }
    
    struct HeaderDetails {
        
        static let apiKey = "X-RapidAPI-Key"
        static let apiKeyValue = "cbeb1cb460msh8c5766448076b59p19448bjsna86cba0794ee"
        static let apiHostKey = "x-rapidapi-host"
        static let apiHostValue = "apidojo-yahoo-finance-v1.p.rapidapi.com"
        
    }
    
    struct ApiDetails {
        
        static let summaryApiDetails = "stock/v2/get-recommendations?symbol=INTC"
        
    }
    
    struct CellDetails {
        
        static let stockTableCell = "StockTableCell"
        
    }
    
    
}
