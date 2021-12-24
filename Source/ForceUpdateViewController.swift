//
//  ForceUpdateViewController.swift
//  Eternity
//
//  Created by Nabeel Nazir on 7/28/21.
//

import UIKit

public class ForceUpdateViewController: UIViewController {
    // MARK:- Outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var descLbl: UILabel!
    @IBOutlet weak var doneButton: UIButton!

    // MARK:- Constants and Variables
    var appversionResponse: [String: Any]?
    
    // MARK:- life Cycle Methods
    public override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }
    
    /**
        Set up views according to User Preference
     - Set Content background View
     - Set up your description Label
     - Set up next button UI
     - Set up Image view
     */
    private func setupView() {
        contentView.backgroundColor = ForceUpdateManager.shared.contentViewBGColor
        setUpDescLbl()
        setUpDoneButton()
        setupLogoImageView()
    }
    
    /**
     This function read content to display from **appversionResponse**  receives from server, sets it to label. This function also update font and text color of label according to user preference, if user hasn't update prefernce for label, default values will set.
     */
    private func setUpDescLbl() {
        let desc = (appversionResponse?[ForceUpdateApiConstants.content] as? String) ?? ""
        descLbl.text = desc
        descLbl.font = UIFont(name: ForceUpdateManager.shared.fontFamily ?? "", size: 17)
        descLbl.textColor = ForceUpdateManager.shared.contentTextColor
    }
    
    /**
     This function read button title from  **appversionResponse**  receives from server, and sets it to next button. This function also update font, background color and text color of button according to user preference, if user hasn't update prefernce for done button, default values will set.
     */
    private func setUpDoneButton() {
        let buttonText = appversionResponse?[ForceUpdateApiConstants.button_text] as? String
        doneButton.setTitle(buttonText, for: .normal)
        doneButton.titleLabel?.font = UIFont(name: ForceUpdateManager.shared.fontFamily ?? "", size: 17)
        doneButton.backgroundColor = ForceUpdateManager.shared.doneButtonBGColor
        doneButton.setTitleColor(ForceUpdateManager.shared.doneButtonTextColor, for: .normal)
    }
    
    /**
     This function gets app logo url from **appversionResponse** receives from server, and download image. This function also tint color of image according to user preference, if user hasn't update prefernce for image, default values will set.
     */
    private func setupLogoImageView() {
        let imageURL = (appversionResponse?[ForceUpdateApiConstants.app_logo] as? String) ?? ""
        logoImageView.tintColor = ForceUpdateManager.shared.placeHolderImageTintColor
        
        downloadImage(from: imageURL) { [weak self] (image) in
            guard let `self` = self else { return }
            self.logoImageView.image = image
        }
    }
    
    /**
     Tries to download image from given url, on completion it passes callback back from where it is being called and send UIImage in that collusure
     - Parameter urlString: string of path from where we want to load image
     - Parameter callback: Callback to send back on completion of download image request
     
     # Notes: #
     1. urlString must be **String** type
     2. callback send **UIImage** of optional type
     */
    private func downloadImage(from urlString: String, callback: @escaping (UIImage?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        getData(from: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            DispatchQueue.main.async() {
                callback(UIImage(data: data))
            }
        }
    }
    
    
    /// Create a network request and send back **data**, **Response** or **error** when request is completed
    /// - Parameters:
    ///   - url: URL to request
    ///   - completion: completion handler that send Data, URLResponse or Error
    func getData(from url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
    }

    // MARK:- UI Actions
    
    
    /// This actions tries to open Url extracted from **appversionResponse** dictionary, if application is unable to open that url we have an alternate URL (alternate url is open to update for any developer) which redirects to Renesis Tech website, which we Open is browser
    @IBAction func didTapForceUpdate(_ sender: Any) {
        guard let urlString = appversionResponse?[ForceUpdateApiConstants.button_url] as? String, let urlToOpen = URL(string: urlString), UIApplication.shared.canOpenURL(urlToOpen) else {
            if let url = URL(string: ForceUpdateManager.shared.alternateURLToLoad) {
                UIApplication.shared.open(url)
            }
            return
        }
        UIApplication.shared.open(urlToOpen)
    }
}

