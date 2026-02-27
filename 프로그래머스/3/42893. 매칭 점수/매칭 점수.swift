import Foundation

func solution(_ word: String, _ pages: [String]) -> Int {
    let target = word.lowercased()

    // url list & mapping
    var urls = Array(repeating: "", count: pages.count)
    var urlToIndex: [String: Int] = [:]

    // base score per page
    var base = Array(repeating: 0, count: pages.count)

    // outgoing links per page (as url strings)
    var outLinks = Array(repeating: [String](), count: pages.count)

    // Regex (robust)
    // 1) <meta ... property="og:url" ... content="https://...">
    //    property/content order can vary; handle both quotes; allow whitespace/newlines
    let metaRegex = try! NSRegularExpression(
        pattern: "<meta[^>]*property\\s*=\\s*['\"]og:url['\"][^>]*content\\s*=\\s*['\"]([^'\"]+)['\"][^>]*>",
        options: [.caseInsensitive]
    )
    // alternate: content first then property (some solutions need this)
    let metaRegex2 = try! NSRegularExpression(
        pattern: "<meta[^>]*content\\s*=\\s*['\"]([^'\"]+)['\"][^>]*property\\s*=\\s*['\"]og:url['\"][^>]*>",
        options: [.caseInsensitive]
    )

    // 2) <a href="https://...">
    let linkRegex = try! NSRegularExpression(
        pattern: "<a\\s+href\\s*=\\s*['\"]([^'\"]+)['\"]",
        options: [.caseInsensitive]
    )

    // 3) word tokenization: replace non-letters with spaces, split
    func countBase(_ html: String) -> Int {
        let lower = html.lowercased()
        var s = ""
        s.reserveCapacity(lower.count)
        for ch in lower {
            if ("a"..."z").contains(ch) { s.append(ch) }
            else { s.append(" ") }
        }
        return s.split(separator: " ").reduce(into: 0) { acc, tok in
            if tok == target { acc += 1 }
        }
    }

    // Helper: first regex capture group
    func firstGroup(_ regex: NSRegularExpression, _ text: String) -> String? {
        let ns = text as NSString
        let range = NSRange(location: 0, length: ns.length)
        guard let m = regex.firstMatch(in: text, options: [], range: range) else { return nil }
        guard m.numberOfRanges >= 2 else { return nil }
        return ns.substring(with: m.range(at: 1))
    }

    // Parse
    for i in 0..<pages.count {
        let html = pages[i]

        // url
        if let u = firstGroup(metaRegex, html) ?? firstGroup(metaRegex2, html) {
            urls[i] = u
            urlToIndex[u] = i
        } else {
            // 문제 입력상 og:url은 반드시 존재한다고 봐도 되지만,
            // 혹시라도 비어있으면 인덱스 깨지니 방어
            urls[i] = ""
        }

        // outgoing links
        do {
            let ns = html as NSString
            let range = NSRange(location: 0, length: ns.length)
            let matches = linkRegex.matches(in: html, options: [], range: range)
            outLinks[i] = matches.map { ns.substring(with: $0.range(at: 1)) }
        }

        // base score
        base[i] = countBase(html)
    }

    // Distribute link score (incoming accumulation)
    var linkScore = Array(repeating: 0.0, count: pages.count)

    for from in 0..<pages.count {
        let outs = outLinks[from]
        if outs.isEmpty { continue }
        let contribution = Double(base[from]) / Double(outs.count)

        for toUrl in outs {
            if let to = urlToIndex[toUrl] {
                linkScore[to] += contribution
            }
        }
    }

    // Pick best (tie -> smaller index)
    var bestIdx = 0
    var best = Double(base[0]) + linkScore[0]

    for i in 1..<pages.count {
        let score = Double(base[i]) + linkScore[i]
        if score > best {
            best = score
            bestIdx = i
        }
    }

    return bestIdx
}