//
//  ShareExtension.swift
//  hw_08
//
//  Created by Dmitry Dementyev on 15.04.2020.
//  Copyright © 2020 Dmitry Dementyev. All rights reserved.
//

import Foundation

class ShareExtension{
    
    let dateFormat = "yyyy.MM.dd G"
    
    let dateRegex = #"(\d{1,2}[-\.,\\\/]\d{1,2}[-\.,\\\/]\d{4})"#
    let metricsRegex = #"(\d{1,}\smi\.|\d{1,}\s{0,}m\.|\d{1,}\s{0,}km\.)"#

    
    let mockText = "hgsd ashj 300 mi. dgaj ajhsbdja12.30.2010 jda sjhdajhs 2-09-2015 hsgdjh asv 10m. jsd 100km. ajs 11/16/2017jhasdhja3\\3\\2000 s"
    
    var text: String = ""
    
    init() {

        if let result = UserDefaults(suiteName: "group.otus.swiftui.localizer"){
            text = result.object(forKey: "shareText") as? String ?? ""
            result.removeSuite(named: "shareText")
        } else {
            text = mockText
        }
        text = mockText
    }
    
    func convert(_ locale: Locale) -> String{
        var newText = text
        do {
            var regex = try NSRegularExpression(pattern: dateRegex)
            var result = regex.matches(in: text, range: NSRange(text.startIndex..., in: text))
            parseText(locale: locale, matches: result, text: &newText, processor: {
                (locale, replacement) in
                return changeDate(locale: locale, replasement: replacement)
            })
            regex = try NSRegularExpression(pattern: metricsRegex)
            result = regex.matches(in: newText, range: NSRange(text.startIndex..., in: newText))
            parseText(locale: locale, matches: result, text: &newText, processor: {
                (locale, replacement) in
                return changeMetrics(locale: locale, replasement: replacement)
            })
        }catch let error{
            print(error)
        }
        return newText
    }
    
    private func parseText(locale: Locale, matches:[NSTextCheckingResult], text: inout String, processor: (_ locale: Locale, _ replasement: String) -> String) {
        var offset = 0
        var nsText = text as NSString
        matches.forEach{
            var range = NSRange()
            range.location = $0.range.location + offset
            range.length = $0.range.length
            let replacement = String(nsText.substring(with: range))
            let convertedString = processor(locale, replacement)
            nsText = nsText.replacingCharacters(in: range, with: convertedString) as NSString
            offset += convertedString.count - $0.range.length
        }
        text = nsText as String
    }
    
    private func changeDate(locale: Locale, replasement: String) -> String {
        let date = setDate(replasement)
        let formater = DateFormatter()
        formater.locale = locale
        formater.setLocalizedDateFormatFromTemplate(dateFormat)
        return date == nil ? "" : formater.string(from: date!)
    }
    
    private func setDate(_ dateString: String) -> Date? {
        if dateString.count < 3 { return nil }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy"
        let s = dateFormatter.date(from: dateString)
        return s
    }
    
    private func changeMetrics(locale: Locale, replasement: String) -> String {
        let measurement = setMeasurement(replasement)
        let formater = MeasurementFormatter()
        formater.locale = locale
        return measurement == nil ? "" :  formater.string(from: measurement!)
    }
    
    private func setMeasurement(_ measurement: String) -> Measurement<Unit>? {
        var digit: Double = 0.0
        do{
            let regex = try NSRegularExpression(pattern: #"\d{1,}"#)
            let result = regex.matches(in: measurement,
                                       range: NSRange(measurement.startIndex..., in: measurement))
            let nsMeasurement = measurement as NSString
            result.first{ item in
                digit = Double(nsMeasurement.substring(with: item.range)) ?? 0.0
                return true
            }
        } catch let error{
            print(error)
            return nil
        }
        if (measurement.contains("km") || measurement.contains("kilometers")){
            return Measurement(value: digit, unit: UnitLength.kilometers)
        } else if (measurement.contains("mi") || measurement.contains("miles")){
            return Measurement(value: digit, unit: UnitLength.miles)
        } else if (measurement.contains("m") || measurement.contains("meters")){
            return Measurement(value: digit, unit: UnitLength.meters)
        } else {
            return nil
        }
    }
}
