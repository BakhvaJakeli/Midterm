//
//  QuestionManager.swift
//  MidTerm
//
//  Created by Baxva Jakeli on 10.06.21.
//

import Foundation

protocol QuestionManagerProtocol: AnyObject {
    func fetchQuestions(completion: @escaping ((TheGame) -> Void))
}

class QuestionManager: QuestionManagerProtocol {
    
    static let shared = QuestionManager()
    
    private init() {
        
    }
    
    func fetchQuestions(completion: @escaping ((TheGame) -> Void)) {
        let url = "https://raw.githubusercontent.com/aaronnech/Who-Wants-to-Be-a-Millionaire/master/questions.json"
        NetworkManager.shared.get(url: url) { (result: Result<TheGame, Error>) in
            switch result {
            case .success(let countries):
                completion(countries)
            case .failure(let error):
                print(error)
            }
        }
    }
}
