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

/// Quitar puntos, saltos de linea, comas, parentesis, apostrofes.
for tx in text {
    let a = tx.replacingOccurrences(of: ".", with: "")
    let b = a.replacingOccurrences(of: "\n", with: " ")
    let c = b.replacingOccurrences(of: ",", with: "")
    let d = c.replacingOccurrences(of: ")", with: "")
    let e = d.replacingOccurrences(of: "(", with: "")
    let f = e.replacingOccurrences(of: "'", with: "")
    let g = f.replacingOccurrences(of: "/", with: "")
    let y = g.replacingOccurrences(of: "  ", with: "")
    
    t.append(y)
}

text = t



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
var queriesFile: StringFile = StringFile(strUrl: "/Users/victoredu96/Desktop/GitHub/InformationRetrieval/Proyecto 2/Cranfield/Cranfield/queries.txt")
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
    let z = n.replacingOccurrences(of: "  ", with: "")
    let w = z.replacingOccurrences(of: "\r", with: "")
    let s = w.replacingOccurrences(of: "  ", with: " ")
    
    
    queryClean.append(s)
}

var uniqueText = [[String]]()
var queriesToken = [[String]]()
var textToken = [[String]]()

var diccionarioText = [[String:Int]]()
var diccionarioText2 = [String:[Int:Int]]()




//print(text)
for doc in text {
    let words = doc.components(separatedBy: " ")
    
    let unique = Array(Set(words))
    uniqueText.append(unique)
    
    textToken.append(words)
    
}

func recall(relevant: Int, retrieved: Int) {
    //print("Calculating Recall...")
}

for quer in queryClean {
    let queries = quer.components(separatedBy: " ")
    //print("QUERIESS \(queries)")
    queriesToken.append(queries)
    
}

/*---------Checar Terminos En Cada Documento---------*/
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
///TODO BIEN HASTA AQUI
var tempDic = [String:Int]()
for doc in uniqueText {
    for term in doc {
        var t: Int = 0
        t += checkTermIn(doc: uniqueText, term: term)
        tempDic[term] = t
    }
    diccionarioText.append(tempDic)
    tempDic.removeAll()
}




// CALCULAR FORMULA
var idfDic = [[String:Double]]()
var ttempDic = [String: Double]()

for documento in diccionarioText {
    for (termino, veces) in documento {
        
        let a = text.count / veces
        
        //print("a = \(text.count) / \(diccionarioText[key]!)")
        ttempDic[termino] = log10(Double(a))
        
    }
    idfDic.append(ttempDic)
    ttempDic.removeAll()
}



var idfDicQ = [[String: Double]]()
var tempQDic = [String: Double]()


for query in queriesToken {
    for term in query {
        for doc in idfDic {
                if doc.keys.contains(term) {
                    tempQDic[term] = doc[term]
                }
        }
    }
    idfDicQ.append(tempQDic)
    tempQDic.removeAll()
}

var estructuraFinal = [(qry_num: Int, doc_num: Int, sc: Double)]()
var qry_num = 0
for query in queriesToken {
    for doc_num in 0..<diccionarioText.count {
        var similarity_coeficient = 0.0
        for term in query {
            if let appereances = diccionarioText[doc_num][term] {
                let idf = idfDic[doc_num][term]!
                let idf_final = Double(appereances) * idf * idf
                similarity_coeficient += idf_final / 10
//                    print("\(term) -- \(appereances) -- \(idf) -- \(idf_final)")
//                    print(similarity_coeficient)
            }
        }
        print("Query: \(qry_num) Doc: \(doc_num) -> \(similarity_coeficient)")
        estructuraFinal.append((qry_num,doc_num, similarity_coeficient))
        
    }
    qry_num += 1
}

/*------------------------------------------------------------*/
var estructuraOrdenada = estructuraFinal.sorted(by: {$0.sc > $1.sc})

// LEER DOCUMENTOS RELEVANTES
var relevantesFile: StringFile = StringFile(strUrl: "/Users/victoredu96/Desktop/GitHub/InformationRetrieval/Proyecto 2/Cranfield/Cranfield/cranqrel.txt")
relevantesFile.open()
var relevantStr = relevantesFile.dataString!
var relevantArray = relevantesFile.array!

var relevantArrayBueno = [String]()

for fila in relevantArray {
    let comp = fila.components(separatedBy: " ")
    for c in comp {
        if c != "" {
            relevantArrayBueno.append(c)
        }
    }
    
    //relevantArrayBueno.append(comp)
    
}


var estructuraRel = [String: [String]]() // Documento: [Relevancia, "Query"]
var listaTemp = [String]()


for var val in 0..<relevantArrayBueno.count {
    listaTemp.append(relevantArrayBueno[val + 1])
    listaTemp.append(relevantArrayBueno[val + 2])
    estructuraRel[relevantArrayBueno[val]] = listaTemp
    listaTemp.removeAll()
    
    
    val += 3
    
    if val + 3 == relevantArrayBueno.count - 1 {
        break
    }
}


//print("NNNNNN \(estructuraRel)")
var estructuraFinal10 = [(qry_num: Int, doc_num: Int, sc: Double)]()
for dobles in 0..<11{
    estructuraFinal10.append(estructuraOrdenada[dobles])
   
}


for dobles in estructuraFinal10{
    print("-----------------------------------------")
    print("Numero De Query: \(dobles.qry_num)\nNumero De Documento: \(dobles.doc_num)\nSimilarity Coeficient: \(dobles.sc)")
    print("-----------------------------------------")
}

func presicion(estructuraFinal10: [(qry_num: Int, doc_num: Int, sc: Double)],
               estructuraRel: [String: [String]]) -> [Int] {  //relevant and retrieved / retrieved
    var presicionArray = [Int]()
    
    var contadorRetrieved = 0
    var contadorRelevant = 0
    
    for tupla in estructuraFinal10 {
        for tuplawer in estructuraRel {
            if String(tupla.doc_num) == tuplawer.key {
                contadorRelevant += 1
                recall(relevant: contadorRelevant, retrieved: contadorRetrieved)
            }
            contadorRetrieved += 1
        }
    }
    
    
    return presicionArray
}

presicion(estructuraFinal10: estructuraFinal10, estructuraRel: estructuraRel)

