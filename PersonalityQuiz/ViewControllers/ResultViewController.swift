//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Alexey Efimov on 30.08.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet var imageLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    
    var answers: [Answer]!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        updateResult()
    }
    
    private func updateResult() {
        
        var animals:[Animal] = []
        var countOfAnimals: [Animal: Int] = [:]
        
        for animal in answers {
            let animal = animal.animal
            animals.append(animal)
        }
        
        for animal in animals {
            if let animalCount = countOfAnimals[animal] {
                countOfAnimals.updateValue(animalCount + 1, forKey: animal)
            } else {
                countOfAnimals[animal] = 1
            }
    }
        
        let sortedCountOfAnimals = countOfAnimals.sorted(by: { (keyVal1, keyVal2) -> Bool in
            keyVal1.value > keyVal2.value
        })
                
        guard let topAnimal = sortedCountOfAnimals.first?.key else { return }

        showResult(_: topAnimal)
 }

    private func showResult(_ animal: Animal) {
        imageLabel.text = "Вы - \(animal.rawValue)!"
        infoLabel.text = animal.definition
    }

}
