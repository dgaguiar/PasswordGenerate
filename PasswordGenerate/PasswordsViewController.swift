//
//  PasswordsViewController.swift
//  PasswordGenerate
//
//  Created by daianne.gomes.aguiar on 15/05/20.
//  Copyright © 2020 daianne.gomes.aguiar. All rights reserved.
//

import UIKit

class PasswordsViewController: UIViewController {
    
    @IBOutlet weak var tvPasswords: UITextView!
    
    var numberOfCharacters: Int = 10
    var numberOfPasswords: Int = 1
    var useLetters: Bool!
    var useNumber: Bool!
    var useCapitalLetters: Bool!
    var useSpecialCharacters: Bool!
    
    var passawordGenerator: PasswordGenerator!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Total de senhas \(numberOfPasswords)"
        passawordGenerator = PasswordGenerator(numberOfCharacters: numberOfCharacters, numberOfPasswords: numberOfPasswords, useLetters: useLetters, useNumber: useNumber, useCapitalLetters: useCapitalLetters, useSpecialCharacters: useSpecialCharacters)
        
        generatePasswords()
    }
    
    func generatePasswords() {
        tvPasswords.scrollRangeToVisible(NSRange(location: 0, length: 0))
        tvPasswords.text = ""
        
        let passwords = passawordGenerator.generate(total: numberOfPasswords)
        for password in passwords {
            tvPasswords.text.append(password + "\n\n")
        }
    }
    
    @IBAction func generate(_ sender: UIButton) {
        generatePasswords()
    }
    
    
}
