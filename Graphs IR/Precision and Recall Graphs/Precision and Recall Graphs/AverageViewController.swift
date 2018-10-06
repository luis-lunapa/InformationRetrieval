//
//  AverageViewController.swift
//  Precision and Recall Graphs
//
//  Created by Victor Eduardo Pulido Contreras on 10/3/18.
//  Copyright © 2018 Victor Eduardo Pulido Contreras. All rights reserved.
//

import UIKit
import Charts

class AverageViewController: UIViewController {

    let recall: [Double] = [0, 10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
    @IBOutlet weak var lineChartView: LineChartView!
    override func viewDidLoad() {
        super.viewDidLoad()

        setRecall()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func setRecall() {
        let avg = Datos.calcularAverage()
        var chartInput = [ChartDataEntry]()
        for a in 0..<recall.count {
            let val = ChartDataEntry(x: recall[a], y: avg[a])
            chartInput.append(val)
        }
        
        let line = LineChartDataSet(values: chartInput, label: "Promedio")
        let data = LineChartData(dataSet: line)
        
        self.lineChartView.data = data
        
        
        
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
