//
//  Currency.swift
//  Currencconvertor
//
//  Created by Auburn University Student on 7/1/25.
//

struct Currency {
    let name: String
    let symbol: String
    let rateToUSD: Double

    func convert(usd: Int) -> String {
        let converted = Double(usd) * rateToUSD
        return "\(symbol)\(String(format: "%.2f", converted))"
    }
}
