//
//  main.swift
//  Cranfield
//
//  Created by Luis Luna on 9/14/18.
//  Copyright © 2018 Luis Luna. All rights reserved.
//

import Foundation
import NaturalLanguage
//var file: StringFile = StringFile(strUrl: "/Users/luisluna/Google Drive/Universidad/Information Retrieval/Proyecto 2/Cranfield/Cranfield/cran.txt")
var file: StringFile = StringFile(strUrl: "/Users/victoredu96/Desktop/GitHub/InformationRetrieval/Proyecto 2/Cranfield/Cranfield/cran.txt")
var cranField = [String]()

file.open()
var i = 0

var index = [String]()
var title = [String]()
var author = [String]()
var b = [String]()
var text = [String]()

var t = [String]()
var queryClean = [String]()


cranField = file.array!


var cran = [String]()

let str = file.dataString!
let token = NLTokenizer(unit: .paragraph)
token.string = str

token.enumerateTokens(in: str.startIndex..<str.endIndex) { tokenRange, _ in
   // print(str[tokenRange])
    cran.append(String(str[tokenRange]))
    //print("-----------------------------------")
    return true
}
var ind = 0
var sub = 0
var indice = ""
var titulo = ""

func leerTitulo(desde: Int, arr: [String]) -> String {
    var titulo = ""
    var d = desde
    while  d < arr.count && !arr[d].contains("A") {
        
        titulo = titulo + arr[d]
        d += 1
    }
    return titulo
}

func leerTexto(desde: Int, arr: [String]) -> String {
    var texto = ""
    var d = desde
    while  d < arr.count && !arr[d].contains("I") {
        
        texto = texto + arr[d]
        d += 1
    }
    return texto
}


var x = 0

while x < cran.count {
    if cran[x].contains("I") {
        index.append(String(cran[x].suffix(3)))
    }
    if cran[x].contains("T") {
        //print("Titulo = \(leerTitulo(desde: x + 1, arr: cran))")
       title.append(leerTitulo(desde: x + 1, arr: cran))
        
    }
    
    if cran[x].contains("W") {
        //print("Titulo = \(leerTitulo(desde: x + 1, arr: cran))")
        text.append(leerTexto(desde: x + 1, arr: cran))
        
    }
    x += 1
    
}
//print("INDEX \(index.count)")
//print("TITULOS \(title.count)")
//print("TEXTOS \(text.count)")

/// Quitar puntos, saltos de linea, comas, parentesis, apostrofes.
for tx in text {
    let a = tx.replacingOccurrences(of: ".", with: "")
    let b = a.replacingOccurrences(of: "\n", with: "")
    let c = b.replacingOccurrences(of: ",", with: "")
    let d = c.replacingOccurrences(of: ")", with: "")
    let e = d.replacingOccurrences(of: "(", with: "")
    let f = e.replacingOccurrences(of: "'", with: "")
    let g = f.replacingOccurrences(of: "/", with: "")
    
    
    t.append(g)
}

text = t


//print(text)

///////// **********************************
///////// *********************************\ LEER QUERIES


func leerTextoQuery(desde: Int, arr: [String]) -> String {
    var texto = ""
    var d = desde
    while  d < arr.count && !arr[d].contains("I") {
        
        texto = texto + arr[d]
        d += 1
    }
    return texto
}

//var queriesFile = StringFile(strUrl: "/Users/luisluna/Google Drive/Universidad/Information Retrieval/Proyecto 2/Cranfield/Cranfield/queries.txt")
var queriesFile: StringFile = StringFile(strUrl: "/Users/victoredu96/Desktop/GitHub/InformationRetrieval/Proyecto 2/Cranfield/Cranfield/cran.txt")
queriesFile.open()
var queriesStr = queriesFile.dataString!

var q = [String]()
let tokenQ = NLTokenizer(unit: .paragraph)
tokenQ.string = queriesStr

var indexQuery = [String]()
var textQuery = [String]()


tokenQ.enumerateTokens(in: queriesStr.startIndex..<queriesStr.endIndex) { tokenRange, _ in
    // print(str[tokenRange])
    q.append(String(queriesStr[tokenRange]))
    //print("-----------------------------------")
    return true
}




var p = 0
while p < q.count {
    if q[p].contains("I") {
        indexQuery.append(String(q[p].suffix(4)))
    }
    
    if q[p].contains("W") {
        //print("Titulo = \(leerTitulo(desde: x + 1, arr: cran))")
        textQuery.append(leerTextoQuery(desde: p + 1, arr: q))
        
    }
    p += 1
}


for qr in textQuery {
    let h = qr.replacingOccurrences(of: ".", with: "")
    let i = h.replacingOccurrences(of: "\n", with: "")
    let j = i.replacingOccurrences(of: ",", with: "")
    let k = j.replacingOccurrences(of: ")", with: "")
    let l = k.replacingOccurrences(of: "(", with: "")
    let m = l.replacingOccurrences(of: "'", with: "")
    let n = m.replacingOccurrences(of: "/", with: "")
    
    
    queryClean.append(n)
}




//print(queryClean)
//print("Index query \(indexQuery.count)")
//print("Index query \(textQuery)")
var uniqueText = [[String]]()

var diccionarioText = [String:Int]()
///print(text)
for doc in text {
    let words = doc.components(separatedBy: " ")
//    print(words.count)
//    print("-----------------------------------")
    let unique = Array(Set(words))
    uniqueText.append(unique)
//    print(unique.count)
//    print("······································r")
    
    
    
    
}

func checkTermIn(doc: [[String]], term: String) -> Int {
    var tet = 0
    for t in doc {
        for f in t {
            if f == term {
                tet += 1
                break
            }
        }
        
    }
    return tet
    
}

//print(uniqueText)
for doc in uniqueText {
    
    for term in doc {
        var t: Int = 0
        
        t += checkTermIn(doc: uniqueText, term: term)
        

        diccionarioText[term] = t
    
       
    }
   
}
for (key, value) in diccionarioText {
    print("\(key) => \(value)")
}
 //print("\(diccionarioText)")

struct Doc {
    var index: String
    var title: String
    var text: String
    
    init (index: String, title: String, text: String) {
        self.index = index
        self.title = title
        self.text = text
    
    }
}
