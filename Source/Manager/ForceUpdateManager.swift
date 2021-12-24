//
//  ForceUpdateManager.swift
//  RenesisForceUpdate
//
//  Created by Nabeel Nazir on 12/23/21.
//

import UIKit

public class ForceUpdateManager {
    
    public static let shared = ForceUpdateManager()
    
    public var contentViewBGColor = UIColor.white
    public var doneButtonBGColor = UIColor.black
    public var doneButtonTextColor = UIColor.white
    public var contentTextColor = UIColor.black
    public var placeHolderImageTintColor = UIColor.black
    public var fontFamily: String?
    public var alternateURLToLoad = "www.renesistech.com"
    
    
    /// This func get ios version from renesis remote and compare with local app version, if local version if lesser from remote version, a new **Update App Screen** is opened which is not cancellable.
    /// - Parameter slug: Slug is actually a unique app identifier, which identifies app on server
    public func checkIfAppVersionIsCompatible(with slug: String) {
        let Url = String(format: "\(ForceUpdateApiConstants.forceUpdateBaseURL)" + "\(slug)")
        guard let serviceUrl = URL(string: Url) else { return }
        var request = URLRequest(url: serviceUrl)
        request.httpMethod = "GET"
        request.setValue("Application/json", forHTTPHeaderField: "Content-Type")
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            if let response = response {
                print(response)
            }
            if let data = data {
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: [])
                    print(json)
                    if let dict = json as? NSDictionary {
                        if (dict[ForceUpdateApiConstants.status] as? String) != nil {
                            if let appDict = dict[ForceUpdateApiConstants.app_detail] as? [String: Any] {
                                let iosServerVersion = appDict[ForceUpdateApiConstants.ios_version] as? String
                                if !self.isAppRunnable(serverVersion: "\(iosServerVersion ?? "")") {
                                    DispatchQueue.main.async {
                                        let bundle = Bundle(identifier: "org.cocoapods.RT-ForceUpdate")
                                        let vc = ForceUpdateViewController(nibName: "ForceUpdateViewController", bundle: bundle)
                                        vc.appversionResponse = appDict
                                        vc.modalTransitionStyle = .crossDissolve
                                        vc.modalPresentationStyle = .overCurrentContext
                                        UIApplication.shared.windows.first?.rootViewController?.present(vc, animated: true, completion: nil)
                                    }
                                }
                            }
                        }
                    }
                } catch {
                    print(error)
                }
            }
        }.resume()
    }
    
    
    /// This func is responsible for comparing local app version to server app version
    /// - Parameter serverVersion: This should be the app version.
    /// - Returns: Returns **True** if app doesn't need force update and rerurn false if app need to be update at any cause.
    private func isAppRunnable(serverVersion: String) -> Bool {
        let serverDividedVersion = serverVersion.split(separator: ".")
        guard let localDividedVersion = getLocalAppVersion()?.split(separator: ".") else { return false }

        var serverVer = ""
        var localVer = ""
        if serverDividedVersion.count == 3 {
            serverVer = "\(serverDividedVersion[0]).\(serverDividedVersion[1])\(serverDividedVersion[2])"
        }
        if localDividedVersion.count == 3 {
            localVer = "\(localDividedVersion[0]).\(localDividedVersion[1])\(localDividedVersion[2])"
        }

        var isRunnable = false
        if (Double(localVer) ?? 0.0 >= Double(serverVer) ?? 0.0) {
            isRunnable = true
        }
        return isRunnable
    }
    
    
    /// - Returns: Returns local app version which is of String Type.
    private func getLocalAppVersion() -> String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
}
