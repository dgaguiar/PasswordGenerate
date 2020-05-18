//
//  PasswordGenerator.swift
//  PasswordGenerate
//
//  Created by daianne.gomes.aguiar on 15/05/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import Foundation

class PasswordGenerator {
    
    var numberOfCharacters: Int
    var numberOfPasswords: Int
    var useLetters: Bool
    var useNumber: Bool
    var useCapitalLetters: Bool
    var useSpecialCharacters: Bool
    
    var passwords: [String] = []
    
    private let letters = "abcdefghijklmnopqrstuvwxyz"
    private let numbers = "12345677890"
    private let specialCharacters = "!@#$%ˆ&*()-_=+:;.,<>?/][}|{~`"
    
    init(numberOfCharacters: Int, numberOfPasswords: Int, useLetters: Bool, useNumber: Bool, useCapitalLetters: Bool, useSpecialCharacters: Bool ) {
        
        var numchars = min(numberOfCharacters, 16)
        numchars = max(numchars, 1)
        
        self.numberOfPasswords = numberOfPasswords
        self.numberOfCharacters = numchars
        self.useLetters = useLetters
        self.useNumber = useNumber
        self.useCapitalLetters = useCapitalLetters
        self.useSpecialCharacters = useSpecialCharacters
    }
    
    func generate(total: Int) -> [String] {
        passwords.removeAll()
        var universe: String = ""
        
        if useLetters {
            universe += letters
        }
        
        if useNumber {
            universe += numbers
        }
        
        if useSpecialCharacters {
            universe += specialCharacters
        }
        
        if useCapitalLetters {
            universe += letters.uppercased()
        }
        
        let universeArray = Array(universe)
        
        while passwords.count < total {
            var password: String = ""
            for _ in 1...numberOfCharacters {
                let index = Int(arc4random_uniform(UInt32(Int32(universeArray.count))))
                password += String(universeArray[index])
            }
            passwords.append(password)
        }
        
        return passwords
    }
}
