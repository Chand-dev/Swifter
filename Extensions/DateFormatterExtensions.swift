//
//  DateFormatterExtensions.swift
//
//  Created by Rok Gregorič
//  Copyright © 2018 Rok Gregorič. All rights reserved.
//

import Foundation

extension DateFormatter {
  convenience init(format: String, timeZone: String? = nil) {
    self.init()
    dateFormat = format
    timeZone.map { self.timeZone = TimeZone(identifier: $0) }
  }

  convenience init(dateStyle: Style = .none, timeStyle: Style = .none, relative: Bool = false, timeZone: String? = nil) {
    self.init()
    self.dateStyle = dateStyle
    self.timeStyle = timeStyle
    doesRelativeDateFormatting = relative
    timeZone.map { self.timeZone = TimeZone(identifier: $0) }
  }

  public static var iso8601full: DateFormatter {
    let formatter = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss.SSSZZZZZ")
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }

  public static var iso8601: DateFormatter {
    let formatter = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ssZZZZZ")
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(secondsFromGMT: 0)
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
  }

  func string(if date: Date?) -> String? {
    return date.map(string(from:))
  }
}
