import Foundation

func solution(_ genres:[String], _ plays:[Int]) -> [Int] {
    
    var genrePlays: [String: Int] = [:]
    var genreSongPlays: [String: [(song: Int, play: Int)]] = [:]
    
    for (i, play) in plays.enumerated() {
        let genre = genres[i]
        genreSongPlays[genre, default: []].append((song: i, play: play))
        genrePlays[genre, default: 0] += play
    }
    
    return genrePlays
        .keys
        .sorted { genrePlays[$0]! > genrePlays[$1]! }
        .flatMap { genre in
            genreSongPlays[genre]!
                .sorted { $0.play == $1.play ? $0.song < $1.song : $0.play > $1.play }
                .prefix(2)
                .map { $0.song }
        }
}