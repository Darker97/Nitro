//
//  FeedParser.swift
//  SimpleRSSReader
//
//  Copyright © 2017 AppCoda. All rights reserved.
//

import Foundation

class FeedParser: NSObject, XMLParserDelegate {
  fileprivate var rssItems = [(title: String, description: String, pubDate: String)]()

  fileprivate var currentElement = ""

  fileprivate var currentTitle = "" {
    didSet {
      currentTitle = currentTitle.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
  }

  fileprivate var currentDescription = "" {
    didSet {
      currentDescription = currentDescription.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
  }

  fileprivate var currentPubDate = "" {
    didSet {
      currentPubDate = currentPubDate.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
    }
  }

  fileprivate var parserCompletionHandler: (([(title: String, description: String, pubDate: String)]) -> Void)?

  func parseFeed(feedURL: String, completionHandler: (([(title: String, description: String, pubDate: String)]) -> Void)?) {
    parserCompletionHandler = completionHandler

    guard let feedURL = URL(string: feedURL) else {
      print("feed URL is invalid")
      return
    }

    URLSession.shared.dataTask(with: feedURL, completionHandler: { data, _, error in
      if let error = error {
        print(error)
        return
      }

      guard let data = data else {
        print("No data fetched")
        return
      }

      let parser = XMLParser(data: data)
      parser.delegate = self
      parser.parse()
    }).resume()
  }

  // MARK: - XMLParser Delegate

  func parserDidStartDocument(_: XMLParser) {
    rssItems.removeAll()
  }

  func parser(_: XMLParser, didStartElement elementName: String, namespaceURI _: String?, qualifiedName _: String?, attributes _: [String: String] = [:]) {
    currentElement = elementName

    if currentElement == "item" {
      currentTitle = ""
      currentDescription = ""
      currentPubDate = ""
    }
  }

  func parser(_: XMLParser, foundCharacters string: String) {
    /// Note: current string may only contain part of info.
    switch currentElement {
    case "title":
      currentTitle += string
    case "description":
      currentDescription += string
    case "pubDate":
      currentPubDate += string
    default:
      break
    }
  }

  func parser(_: XMLParser, didEndElement elementName: String, namespaceURI _: String?, qualifiedName _: String?) {
    if elementName == "item" {
      let rssItem = (title: currentTitle, description: currentDescription, pubDate: currentPubDate)
      rssItems.append(rssItem)
    }
  }

  func parserDidEndDocument(_: XMLParser) {
    parserCompletionHandler?(rssItems)
  }

  func parser(_: XMLParser, parseErrorOccurred parseError: Error) {
    print(parseError.localizedDescription)
  }
}
