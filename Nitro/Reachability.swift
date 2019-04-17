//
//  Reachability.swift
//  Nitro
//
//  Created by Christian Baltzer on 29.12.18.
//  Copyright © 2018 Christian Baltzer. All rights reserved.
//

import Foundation
import SystemConfiguration

public class Reachability {
    class func isConnectedToNetwork() -> Bool {
        var Status: Bool = false
        let url = NSURL(string: "http://google.com/")
        let request = NSMutableURLRequest(url: url! as URL)
        request.httpMethod = "HEAD"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringLocalAndRemoteCacheData
        request.timeoutInterval = 10.0

        var response: URLResponse?
        do {
            var data = try NSURLConnection.sendSynchronousRequest(request as URLRequest, returning: &response) as NSData?
        } catch {
            return false
        }

        if let httpResponse = response as? HTTPURLResponse {
            if httpResponse.statusCode == 200 {
                Status = true
            }
        } else {
            Status = false
        }

        return Status
    }
}
