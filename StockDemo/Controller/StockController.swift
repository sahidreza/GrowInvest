//
//  ViewController.swift
//  StockDemo
//
//  Created by Sahid Reza on 27/06/21.
//

import UIKit

class StockController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var stockDataList = [ShowStockData]()
    private var stockSummarryManager = StockSumarryManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        stockSummarryManager.delegate = self
        stockSummarryManager.getStockSummeryData()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: K.CellDetails.stockTableCell, bundle: nil), forCellReuseIdentifier: K.CellDetails.stockTableCell)

    }
    
}


extension StockController:StockSummaryManagerDelegate{
    func saveStockData(stockData: [ShowStockData]) {
        
        DispatchQueue.main.async {
            
            self.stockDataList = stockData
            self.tableView.reloadData()
        }
        
        
    }
    
    func errorData(error: Error) {
        
        print(error.localizedDescription)
    }
    
    
}

extension StockController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return stockDataList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.CellDetails.stockTableCell, for: indexPath) as! StockTableCell
        
        cell.sortNameLabel.text = stockDataList[indexPath.row].shortName
        cell.symBolLabel.text = stockDataList[indexPath.row].symbol
        cell.priceLabel.text = stockDataList[indexPath.row].postMarketPrice
        
        return cell
    }
    
    
    
    
}

