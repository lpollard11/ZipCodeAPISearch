//
//  ViewController.swift
//  ZipCodeAPISearch
//
//  Created by lpollard11 on 01/30/2017.
//  Copyright (c) 2017 lpollard11. All rights reserved.
//

import UIKit
import ZipCodeAPISearch

class ViewController: UIViewController {
    
    @IBOutlet private weak var textField: UITextField!
    @IBOutlet internal weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet internal weak var resultsLabel: UILabel!
    @IBOutlet private weak var searchButton: UIButton!
    
    internal var searchText = ""
    
    private var zipCodeAPIManager: ZipCodeAPIManagerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupZipCodeAPIManager()
    }
    
    private func setupZipCodeAPIManager() {
        zipCodeAPIManager = ZipCodeAPIManager(locationLoader: locationLoader())
        zipCodeAPIManager?.delegate = self
    }
    
    private func locationLoader() -> LocationLoaderProtocol {
        // Use temporary or client API key from zipcodeapi.com
        let endPointConstructor: EndpointConstructionProtocol = EndpointConstructor(responseFormat: .json,
                                                                                    units: .degrees,
                                                                                    apiKey: "bIoG88J8861TUkdBBz9KmBbqX58EeUTqCi6KrPTAWUtQfGsQfBBCdN2aTbO76IyI")
        let networkingManager : NetworkingProtocol = NetworkingManager()
        return LocationLoader(endPointConstructor: endPointConstructor, networkingManager: networkingManager)
    }
    
    private func fetchLocation() {
        activityIndicator.startAnimating()
        zipCodeAPIManager?.searchZipCode(searchText)
    }
    
    @IBAction private func searchButtonTapped(sender: UIButton) {
        fetchLocation()
    }
}

extension ViewController: ZipCodeAPIManagerDelegate {
    
    func handleZipCodeResult(_ location: Location?, error: Error?) {
        // Stop activity indicator
        activityIndicator.stopAnimating()
        
        guard let location = location, let city = location.city else {
            // Show error
            return
        }
        
        resultsLabel.text = city
    }
}

extension ViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        guard let text = textField.text else {
            return true
        }
        
        let updatedText = (text as NSString).replacingCharacters(in: range, with: string)
        
        searchText = updatedText
        
        return true
    }
}
