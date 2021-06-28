//
//  StockSumarryManager.swift
//  StockDemo
//
//  Created by Sahid Reza on 27/06/21.
//

import Foundation
import ProgressHUD

protocol StockSummaryManagerDelegate {

    func saveStockData(stockData:[ShowStockData])
    func errorData(error:Error)
}


struct StockSumarryManager{
    
    
    var delegate:StockSummaryManagerDelegate?
    
    
    func getStockSummeryData(){
        
        ProgressHUD.show()
        
        let url = K.baseUrl + K.ApiDetails.summaryApiDetails
        perFromRequst(with: url)
    }
    
    func perFromRequst(with stringUrl:String){
        
        let headers =  [
            K.HeaderDetails.apiKey : K.HeaderDetails.apiKeyValue,
            K.HeaderDetails.apiHostKey : K.HeaderDetails.apiHostValue
        ]
        
        let request = NSMutableURLRequest(url: NSURL(string: stringUrl)! as URL,
                                          cachePolicy: .useProtocolCachePolicy,
                                          timeoutInterval: 10.0)
        request.httpMethod = K.getMethod
        request.allHTTPHeaderFields = headers
        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) in
            
            ProgressHUD.dismiss()
            
            if (error != nil) {
                delegate?.errorData(error: error!)
                
                return
                
            }
            
            if let safeData = data {
                
                if let stockData = self.phareseJson(safeData){
                    
                    self.delegate?.saveStockData(stockData: stockData)
                
                }
                
            }
            
            
        })
        
        dataTask.resume()
        
        
    }
    
    
    func phareseJson(_ stockSummaryData:Data) -> [ShowStockData]? {
        
        let jsonDecoder = JSONDecoder()
        
        do{
            
            let docoDableData = try jsonDecoder.decode(StockSumarryDetails.self, from: stockSummaryData)
            let responseData = docoDableData.finance.result[0].quotes
            var stockList =  [ShowStockData]()
            
            for allData in responseData{
                
                let shortName = allData.shortName
                let symbol = allData.symbol
                let postMarketPrice = String(allData.postMarketPrice)
                let singStockSummary = ShowStockData(shortName: shortName, symbol: symbol, postMarketPrice: postMarketPrice)
                stockList.append(singStockSummary)
            }
            
            return stockList
            
        } catch let error {
            
            delegate?.errorData(error: error)
            
            return nil
        }
        
        
    }
    
    
}


