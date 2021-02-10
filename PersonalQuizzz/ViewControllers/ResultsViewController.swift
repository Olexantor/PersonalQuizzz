//
//  ResultsViewController.swift
//  PersonalQuizzz
//
//  Created by Александр on 10.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {
    
    
    //MARK: IB Outlets
    @IBOutlet var resultEmojiLabel: UILabel!
    @IBOutlet var resultDescriptionLabel: UILabel!
    
    //MARK: Public Properties
    var answersChoosen: [Answer] = []
 
    //MARK: Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        showResult()
    }
    
    //MARK: Private Methods
    private func showResult() {
        
        var dogCount = 0
        var catCount = 0
        var rabbitCount = 0
        var turtleCount = 0
        
        for answerChoosen in answersChoosen {
            switch answerChoosen.type {
            case .dog:
                dogCount += 1
            case .cat:
                catCount += 1
            case .rabbit:
                rabbitCount += 1
            case .turtle:
                turtleCount += 1
            }
        }
        
        let resultDictionary: [AnimalType: Int] = [
            .dog: dogCount,
            .cat: catCount,
            .rabbit: rabbitCount,
            .turtle: turtleCount
        ]
        
        let result = resultDictionary.sorted { $0.value > $1.value }.first
        if let result = result {
            resultEmojiLabel.text = "ВЫ - \(result.key.rawValue)"
            resultDescriptionLabel.text = result.key.definition
        }
    }
}
