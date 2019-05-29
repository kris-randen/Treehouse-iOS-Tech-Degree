import Foundation

typealias Name = String
typealias Names = [Name]
typealias Player = (name: Name, guardianName: Name, height: Height, isExperienced: Bool, team: Name)
typealias Players = [Player]
typealias PlayerInformation = [Name: Player]
typealias Team = Names
typealias Teams = [Name: Team]
typealias Height = Double
typealias Heights = [Height]
typealias Letter = String
typealias Letters = [Name: [Name: Letter]]


let date = Date()
let dateFormatter = DateFormatter()
dateFormatter.dateFormat = "MMM dd, YYYY"
let currentDate = dateFormatter.string(from: date)


let HEIGHT          = "HEIGHT"
let NAME            = "NAME"
let GUARDIAN_NAME   = "GUARDIAN_NAME"

let SORT_BY: [String] =     [
                                HEIGHT,
                                NAME,
                                GUARDIAN_NAME
                            ]

let DRAGONS         = "Dragons"
let SHARKS          = "Sharks"
let RAPTORS         = "Raptors"

let TEAM_NAMES      =       [
                                DRAGONS,
                                SHARKS,
                                RAPTORS
                            ]

let PRACTICE_TIMES  =       [
                                "March 17, 1pm",
                                "March 17, 3pm",
                                "March 18, 1pm"
                            ]

let TEAM_PRACTICE_TIME =    [
                                TEAM_NAMES[0]: PRACTICE_TIMES[0],
                                TEAM_NAMES[1]: PRACTICE_TIMES[1],
                                TEAM_NAMES[2]: PRACTICE_TIMES[2]
                            ]

func concatenateStringArray(first: [String], and second: [String], withDelimiter delim: String = " ") -> [String]
{
    if (first.count != second.count)
    {
        print("Array inputs to the concatenateStringArray function are not of matching sizes. Please check and try again.")
    }
    
    var firstAndSecond: [String] = [String](repeating: "", count: first.count)
    
    for i in 0..<first.count
    {
        firstAndSecond[i] = first[i] + delim + second[i]
    }
    
    return firstAndSecond
}

func joinArray(first: [String], and second: [String]) -> [String]
{
    var joined = [String]()
    
    for element in first
    {
        joined.append(element)
    }
    
    for element in second
    {
        joined.append(element)
    }
    
    return joined
}


let firstNameOfPlayers: Names =      [
                                            "Joe",
                                            "Jill",
                                            "Bill",
                                            "Eva",
                                            "Matt",
                                            "Kimmy",
                                            "Sammy",
                                            "Karl",
                                            "Suzane",
                                            "Sal",
                                            "Joe",
                                            "Ben",
                                            "Diego",
                                            "Chloe",
                                            "Arnold",
                                            "Phillip",
                                            "Les",
                                            "Herschel"
                                        ]

let lastNameOfPlayers: Names =       [
                                            "Smith",
                                            "Tanner",
                                            "Bon",
                                            "Gordon",
                                            "Gill",
                                            "Stein",
                                            "Adams",
                                            "Saygan",
                                            "Greenberg",
                                            "Dali",
                                            "Kavalier",
                                            "Finkelstein",
                                            "Soto",
                                            "Alaska",
                                            "Willis",
                                            "Helm",
                                            "Clay",
                                            "Krustofski"
                                        ]

let namesOfGuardians: Names =        [
                                            "Jim and Jan Smith",
                                            "Clara Tanner",
                                            "Sara and Jenny Bon",
                                            "Wendy and Mike Gordon",
                                            "Charles and Sylvia Gill",
                                            "Bill and Hillary Stein",
                                            "Jeff Adams",
                                            "Heather Bledsoe",
                                            "Henrietta Dumas",
                                            "Gala Dali",
                                            "Sam and Elaine Kavalier",
                                            "Aaron and Jill Finkelstein",
                                            "Robin and Sarika Soto",
                                            "David and Jamie Alaska",
                                            "Claire Willis",
                                            "Thomas Helm and Eva Jones",
                                            "Wynonna Brown",
                                            "Hyman and Rachel Krustofski"
                                        ]

let namesOfPlayers = concatenateStringArray(first: firstNameOfPlayers, and: lastNameOfPlayers)

let heightOfPlayers: Heights =         [
                                            42,
                                            36,
                                            43,
                                            45,
                                            40,
                                            41,
                                            45,
                                            42,
                                            44,
                                            41,
                                            39,
                                            44,
                                            41,
                                            47,
                                            43,
                                            44,
                                            42,
                                            45
                                        ]

let experiencedSoccerPlayer: [Bool] =   [
                                            true,
                                            true,
                                            true,
                                            false,
                                            false,
                                            false,
                                            false,
                                            true,       // Changing to false just for a check
                                            true,
                                            false,
                                            false,
                                            false,
                                            true,
                                            false,
                                            false,
                                            true,
                                            true,
                                            true
                                        ]

func playersSortedBy(_ players: Players, by sortBy: Int = 0) -> Players
{
    var players = players
    switch sortBy
    {
    case 0:
        players.sort(by: {$0.height > $1.height})
    case 1:
        players.sort(by: {$0.name < $1.name})
    case 2:
        players.sort(by: {$0.guardianName < $1.guardianName})
    default:
        print("You can only sort the players by:")
        for i in 0..<SORT_BY.count
        {
            print("\(i) = \(SORT_BY[i])")
        }
        print   ("""
                Please check that your sortBy index is within 0 and \(SORT_BY.count - 1).
                Returning unsorted players.
                """)
    }
    return players
}

func createPlayersFrom    (
                                        names: [String],
                                        withGuardianNames guardianNames: [String],
                                        withHeights heights: [Double],
                                        withSoccerExperience areExperienced: [Bool],
                                        sortedBy sortBy: Int = 0
                                    ) -> [Player]
{
    if (names.count, guardianNames.count, heights.count, areExperienced.count) != (guardianNames.count, heights.count, areExperienced.count, names.count)
    {
        print("Array inputs to the createPlayerInformationFrom function are not of matching sizes. Please check and try again.")
    }
    
    var players: Players = []
    
    for i in 0..<names.count
    {
        players.append((name: names[i], guardianName: guardianNames[i], height: heights[i], isExperienced: areExperienced[i], team: ""))
    }
    
   return playersSortedBy(players)
}

func createPlayerInformationMapFor(_ players: Players) -> PlayerInformation
{
    var playerInformation = PlayerInformation()
    
    for player in players
    {
        playerInformation[player.name] = player
    }
    return playerInformation
}

let players = createPlayersFrom(names: namesOfPlayers, withGuardianNames: namesOfGuardians, withHeights: heightOfPlayers, withSoccerExperience: experiencedSoccerPlayer, sortedBy: 3)

let playerInformation = createPlayerInformationMapFor(players)

func findNumberOfExperiencedPlayersFor(_ team: Team) -> Int
{
    var n = 0
    
    for player in team
    {
        if playerInformation[player] == nil
        {
            print("Player with name \(player) doesn't exist in the team.")
        }
        else
        {
            if playerInformation[player]!.isExperienced { n += 1 }
        }
    }
    
    return n
}


func extractPlayersFromAll(_ players: Players, withExperience isExperienced: Bool = true) -> Players
{
    var extracted: Players = []
    
    for player in players
    {
        if player.isExperienced == isExperienced
        {
            extracted.append(player)
        }
    }
    return extracted
}

let playersWithExperience = extractPlayersFromAll(players, withExperience: true)
let playersWithoutExperience = extractPlayersFromAll(players, withExperience: false)

func draw(players: Players, forDrawNumber draw: Int, into nTeams: Int) -> Team
{
    var team = Team()
    
    if players.count % nTeams != 0
    {
        print("\(players.count) Players can't be drawn into \(nTeams) equally sized teams. Returning empty team.")
        return team
    }
    else if draw > nTeams
    {
        print("There can only be \(nTeams) draws for \(nTeams) teams. Please check your number and try again. Returning empty team.")
        return team
    }
    
    let size = players.count / nTeams
    
    for i in 0..<size
    {
        let index = (i % 2 == 0) ? ((i * nTeams) + draw - 1) : ((i * nTeams) + nTeams - draw)
        team.append(players[index].name)
    }
    
    return team
}

let dragonsInexperienced    = draw(players: playersWithoutExperience, forDrawNumber: 1, into: 3)
let sharksInexperienced     = draw(players: playersWithoutExperience, forDrawNumber: 2, into: 3)
let raptorsInexperienced    = draw(players: playersWithoutExperience, forDrawNumber: 3, into: 3)

let dragonsExperienced      = draw(players: playersWithExperience, forDrawNumber: 2, into: 3)
let sharksExperienced       = draw(players: playersWithExperience, forDrawNumber: 3, into: 3)
let raptorsExperienced      = draw(players: playersWithExperience, forDrawNumber: 1, into: 3)

let dragons                 = joinArray(first: dragonsInexperienced, and: dragonsExperienced)
let sharks                  = joinArray(first: sharksInexperienced, and: sharksExperienced)
let raptors                 = joinArray(first: raptorsInexperienced, and: raptorsExperienced)

var teams                   = Teams()

teams[DRAGONS]              = dragons
teams[SHARKS]               = sharks
teams[RAPTORS]              = raptors

func findAverageHeightFor(_ team: Team) -> Double
{
    var totalHeight: Height = 0
    
    for player in team
    {
        if playerInformation[player] == nil
        {
            print("Player with name \(player) doesn't exist in the team.")
        }
        else
        {
            totalHeight += playerInformation[player]!.height
        }
    }
    return totalHeight / Double(team.count)
}

let dragonsHeight = findAverageHeightFor(dragons)
let sharksHeight = findAverageHeightFor(sharks)
let raptorsHeight = findAverageHeightFor(raptors)

func experienceBalanceCheckFor(_ teams: Teams) -> Bool
{
    var n = -1
    
    for (_, team) in teams
    {
        if n == -1
        {
            n = findNumberOfExperiencedPlayersFor(team)
        }
        else
        {
            if n != findNumberOfExperiencedPlayersFor(team) { return false }
        }
    }
    return true
}

func heightBalanceCheckerFor(_ teams: Teams, withinTolerance tol: Height = 1.5) -> Bool
{
    var averageHeights = Heights()
    
    for (_, team) in teams
    {
        averageHeights.append(findAverageHeightFor(team))
    }
    
    for i in 0..<averageHeights.count
    {
        for j in (i + 1)..<averageHeights.count
        {
            let delta = averageHeights[i] - averageHeights[j]
            if (delta < -tol || delta > tol)
            {
                return false
            }
        }
    }
    
    return true
}

let experienceIsBalanced = experienceBalanceCheckFor(teams)
let heightIsBalanced = heightBalanceCheckerFor(teams)

func createLetterToParentFor(_ playerName: Name, inTeam teamName: Name) -> Letter
{
    let player = playerInformation[playerName]!
    let letter =
    """
        Date: \(currentDate)

        From
    
        Kris Rajendren
        Soccer League Coordinator
        Middlebrown High School
        Hillsboro OR - 97124

        To
    
        \(player.guardianName)

        Subject: Invitation to soccer league practice

        Dear Parent(s)

        Congratulations! \(player.name) is now playing for team \(teamName).
        Their next practice session is on \(TEAM_PRACTICE_TIME[teamName]!).
        We look forward to seeing you there!

        Yours Sincerely
        Kris Rajendren
    """
    
    return letter
}


func createLettersToAllParentsFor(_ teams: Teams) -> Letters
{
    var letters = Letters()
    for (name, team) in teams
    {
        var teamLetters = [Name: Letter]()
        for player in team
        {
            teamLetters[player] = createLetterToParentFor(player, inTeam: name)
        }
        letters[name] = teamLetters
    }
    return letters
}

let letters = createLettersToAllParentsFor(teams)

print(letters[RAPTORS]![raptors[5]]!)
