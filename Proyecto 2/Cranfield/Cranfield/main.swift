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


//print(queryClean)
//print("Index query \(indexQuery.count)")
//print("Index query \(textQuery)")
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
//for uni in uniqueText {
//    for a in uni {
//        print("\(a)")
//    }
//    print("------SIGUIENTE---------")
//}

//print("TEXT TOKEN =--->>> \(textToken.count)")

for quer in queryClean {
    let queries = quer.components(separatedBy: " ")
    //print("QUERIESS \(queries)")
    queriesToken.append(queries)
    
}
//print("TOKEN == \(queriesToken)")
//for q in queriesToken {
//    for a in q {
//        print(a)
//
//    }
//
//    print("-------------")
//}

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


var numeroDoc = 1
var numeroQuery = 1

var sc = [[Double: [Int: Int]]]() // Valor - Query - Documento
var scTemp = [Double: [Int: Int]]()
var suma = [Double]()






for query in idfDicQ {
    for doc in idfDic {
        
        for (term, val) in query {
            
            for (termDoc, valDoc) in doc {
                
//                print("\(termDoc) => \(valDoc)")
//                print("\(term) => \(val)")
//                print("&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&")
                if term == termDoc {
                    suma.append(val * valDoc)
                    //print("SUME \(val) + \(valDoc)")
                }
            }

        }

       numeroDoc += 1
    } // FIN DOCUMENTO !
    
    
    
    
//     numeroQuery += 1
//    sc.append(scTemp)
//    scTemp.removeAll()
    
    
}
//
//for doc in idfDic {
//    for (key, value) in doc {
//        for query in queriesToken {
//            for term in query {
//                if term == key {
//                    tempQDic[term] = value
//                }
//            }
//            idfDic.append(tempQDic)
//            tempQDic.removeAll()
//
//        }
//    }
//
//}

//print(idfDic)
//for a in idfDicQ {
//    print(a)
//    print("************************")
//}

//var idfDicQ = [String:Double]()
//for (key, value) in idfDic {
//    for elementQuery in queriesToken {
//        for term in elementQuery {
//            if term == key {
//                idfDicQ[term] = value
//            }
//        }
//    }
//}





//var queryWithIDFArray = [[String: Double]]()
//for queries in queriesToken {
//    for term in queries {
//        for (key, value) in idfDicQ {
//            if term == key {
//                queryWithIDFArray.append([term:value])
//
//            }
//        }
//    }
//}
//
//
//
//var textWithIDFArray = [[String: Double]]()
//for texto in textToken {
//    for (key, value) in idfDic {
//        for term in texto {
//            if term == key {
//                textWithIDFArray.append([term:value])
//            }
//        }
//    }
//}


//print(textWithIDFArray)
//print(diccionarioText)
//print(queryWithIDFArray)

//print(textQuery)
//print(queryClean)
//print(queriesToken)
//print(uniqueText)

var qry_num = 0
for query in queriesToken {
    for doc_num in 0..<diccionarioText.count {
        var similarity_coeficient = 0.0
        for term in query {
            if let appereances = diccionarioText[doc_num][term] {
                let idf = idfDic[doc_num][term]!
                let idf_final = Double(appereances) * idf * idf
                similarity_coeficient += idf_final
//                    print("\(term) -- \(appereances) -- \(idf) -- \(idf_final)")
//                    print(similarity_coeficient)
            }
        }
        print("Query: \(qry_num) Doc: \(doc_num) -> \(similarity_coeficient)")
    }
    qry_num += 1
}



func innerProduct(idfQuery: [[String: Double]], idfDocumentos: [[String: Double]]) -> [[Int:Double]] {
    var idfFinal = [[Int: Double]]()
    
    for query in idfDocumentos {
        print(query)
        print("------------------------")
    }
    
    
    
    
    
    return idfFinal
}

//innerProduct(idfQuery: queryWithIDFArray, idfDocumentos: textWithIDFArray)

/*------------------------------------------------------------*/



