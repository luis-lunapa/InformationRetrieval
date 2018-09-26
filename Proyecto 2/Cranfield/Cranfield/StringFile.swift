//
//  StringFile.swift
//  Cranfield
//
//  Created by Luis Luna on 9/14/18.
//  Copyright © 2018 Luis Luna. All rights reserved.
//

import Foundation

class StringFile {
    var array: Array<String>?
    var next: Int
    var filePath: String?
    var url: URL?
    var dataString: String?
    
    init(strUrl: String) {
        array = []
        next = 0
        
       //filePath = Bundle.main.path(forResource: "cran", ofType: "txt") ?? "Valio verga"
        url = URL(fileURLWithPath: strUrl)
    }
    
    func open() {
        var dataText: String?
        do {
            dataText = try! String(contentsOf: url!, encoding: String.Encoding.utf8)
            //dataText = try String(contentsOfFile: filePath, encoding: String.Encoding.utf8)
            array = dataText!.components(separatedBy: "\n")
            self.dataString = dataText
           
            
        }
        catch let error as NSError {
            print("Error: \(error)")
        }
        
    }
    
    func size () -> Int {
        return array!.count - 1
    }
    
    func get(_ i: Int) -> String? {
        var string: String?
        
        if (array?.count)! > 0 {
            if i < size() && i >= 0 {
                string = array?[i]
                next = i + 1
            }
        }
        return string
    }
}
