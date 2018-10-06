//
//  ViewController.swift
//  Precision and Recall Graphs
//
//  Created by Victor Eduardo Pulido Contreras on 9/29/18.
//  Copyright © 2018 Victor Eduardo Pulido Contreras. All rights reserved.
//

import UIKit
import Charts

class ViewController: UIViewController {
    let recall: [Double] = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    var query = 0
    @IBOutlet weak var lineChartView: LineChartView!
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        setRecall()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func setRecall() {

        var chartInput = [ChartDataEntry]()
        for a in 0..<recall.count {
            let val = ChartDataEntry(x: recall[a], y: Datos.precisionQueries[query][a])
            chartInput.append(val)
        }
        
        let line = LineChartDataSet(values: chartInput, label: "Query \(self.query + 1)")
        let data = LineChartData(dataSet: line)
        
        self.lineChartView.data = data
        
        
        
        

    }
    
    @IBAction func siguienteQPressed(_ sender: Any) {
        if self.query == self.recall.count - 2 {
            self.query = 0
            
        } else {
            self.query += 1
        }
        self.setRecall()
    }
    
}

class Datos {
    
    
    private static let query1 = [100, 83.0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    private static let query2 = [66.6, 66.6, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    private static let query3 = [50.0, 50.0, 66.6, 75.0, 80.0, 71.4, 75.0, 0, 0, 0, 0]
    private static let query4 = [25.0, 25.0, 25.0, 25.0, 33.3, 33.3, 33.3, 0, 0, 0, 0]
    private static let query5 = [16.6, 16.6, 16.6, 22.2, 22.2, 0, 0, 0, 0, 0, 0]
    private static let query6 = [50.0, 50.0, 50.0, 40, 40, 0, 0, 0, 0, 0, 0]
    private static let query7 = [50.0, 50.0, 33.3, 33.3, 42.8, 42.8, 0, 0, 0, 0, 0]
    private static let query8 = [20.0, 25.0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    private static let query9 = [14.2, 14.2, 14.2, 0, 0, 0, 0, 0, 0, 0, 0]
    private static let query10 = [50.0, 50.0, 66.6, 0, 0, 0, 0, 0, 0, 0, 0]
    private static var avg =     [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    static var precisionQueries = [query1, query2,query3,query4,query5,query6,query7,query8,
                                   query9,query10]
    
    static func calcularAverage() -> [Double]{
        var avgQueries = [Double]()
        for i in 0..<query1.count {
            let suma = query1[i] + query2[i] + query3[i] + query4[i] + query5[i] + query6[i] + query7[i] + query8[i] + query9[i] + query10[i]
            avgQueries.append(suma / Double(query1.count))

            
        }
        
    return avgQueries
    }
    
    
    
}

