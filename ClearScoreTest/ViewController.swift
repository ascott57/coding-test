//
//  ViewController.swift
//  ClearScoreTest
//
//  Created by Anthony Scott on 2019/11/21.
//
//  High-level business logic.  Main view display initiates data fetch and display, since there is not interaction as
//  per the brief.  One might separate some of this using a Presenter class and Interactor class, but it seems overkill
//  for a simple test with one view.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var circleView: CircleView?
    @IBOutlet weak var spinner: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showCreditScore()
    }
    
    private func showCreditScore() {
        let apiManager = APIManager()
        
        showSpinner()
        apiManager.getScore(success: { value, minValue, maxValue in
            self.hideSpinner()
            self.circleView?.showScore(score: value, maxValue: maxValue)
        }, failure: {
            self.hideSpinner()
            self.showError()
        })

    }
    
    private func showError() {
        // generates runtime non-fatal error unless everything is in main thread async block
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: "Error", message: "Call failed", preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: "Dismiss", style: .default))
            self.present(alertController, animated: true, completion: nil)
        }

    }
    
    private func showSpinner() {
        DispatchQueue.main.async {
            self.spinner?.startAnimating()
        }
    }
    
    private func hideSpinner() {
        DispatchQueue.main.async {
            self.spinner?.stopAnimating()
        }
    }

}

