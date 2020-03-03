//
//  QuoteViewController.swift
//  MoodTracker
//
//  Created by Claudia Contreras on 2/25/20.
//  Copyright © 2020 thecoderpilot. All rights reserved.
//


import UIKit

class QuoteViewController: UIViewController {
    
    //MARK: - Properties
    var mood: Mood?
    var moodController: MoodModelController?
    
    var quote = [Quote]() {
        didSet {
               let url = URL(string: self.quote[0].media)
               self.imageView.downloadImage(from: url!)
        }
    }

    
    //MARK: - IBOutlet
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let quoteRequest = QuoteRequest()
        quoteRequest.getQuote {[weak self] result in
            switch result {
            case.success(let quotes):
                self?.quote = quotes
            case.failure(let error):
                print(error)
            }
            
        }
        //Button to share the quote with others
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
    }
    
    @IBAction func trackingBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8) else {
            print ("No image found")
            return
        }
        let vc = UIActivityViewController(activityItems: [image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }

}

//MARK: - Extension
extension UIImageView {
   func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
      URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
   }
   func downloadImage(from url: URL) {
      getData(from: url) {
         data, response, error in
         guard let data = data, error == nil else {
            return
         }
         DispatchQueue.main.async() {
            self.image = UIImage(data: data)
         }
      }
   }
}
