import Policies

typealias Policy = PolicyLite

// swiftlint:disable line_length
let policies: [PolicyLite] = [
    Policy(id: 0,
           text: "Cut national insurance by 2p",
           additionalInfo: """
           This is worth £450 per year for the average worker on £35,000.
           """,
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 1,
           text: "Abolish the main rate of National Insurance for the self-employed",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 2,
           text: "Introduce a pension Triple Lock Plus",
           additionalInfo: """
           The means the personal allowance for pensioners will always rise with inflation, earnings or 2.5%, whichever is higher.
           This is already the case for the State Pension.
           """,
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 3,
           text: "30 hours a week free childcare when a 9 months of age until they start school",
           type: .families,
           parties: [.conservatives]),

    Policy(id: 4,
           text: "Move to a household system for child benefit",
           additionalInfo: """
           This would mean that child benefit is calculated based on a total household income, rather than thresholds for individual earners.
           It will benefit families that have a single main earner.
           """,
           type: .families,
           parties: [.conservatives]),

    Policy(id: 5,
           text: "No new green levies or charges to be introduced",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: 6,
           text: "Introduce a mandatory National Service for all school leavers at 18",
           additionalInfo: """
           The National Service would allow a choice between a competitive placement in the military or civic service roles.
           """,
           type: .rights,
           parties: [.conservatives]),

    Policy(id: 7,
           text: "Fund 100,000 high-quality apprenticeships by curbing the number of poor-quality university degrees",
           type: .education,
           parties: [.conservatives]),

    Policy(id: 8,
           text: "Ban the use of mobile phones during the school day",
           type: .education,
           parties: [.conservatives]),

    Policy(id: 9,
           text: "Ensure parents can see what their children are being taught, especially on sensitive matters like sex education",
           type: .education,
           parties: [.conservatives]),

    Policy(id: 10,
           text: "Introducing the Advanced British Standard which combines A-Levels and T-Levels for 16-19 year olds",
           type: .education,
           parties: [.conservatives]),

    Policy(id: 11,
           text: "Increase defence spending to the 2.5% of GDP by 2030",
           type: .defence,
           parties: [.conservatives]),

    Policy(id: 12,
           text: "Introduce a legal cap on migration to guarantee that numbers will fall every year",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 13,
           text: "Deport illegal immigrants to Rwanda",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 14,
           text: "Work with other countries to rewrite international asylum treaties",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 15,
           text: "Increase NHS spending above inflation every year",
           type: .healthSocialCare,
           parties: [.conservatives]),

    Policy(id: 16,
           text: "Rewrite the Equality Act to define sex as biological sex",
           type: .rights,
           parties: [.conservatives]),

    Policy(id: 17,
           text: "Abolish Stamp Duty for homes up to £425,000 for first time buyers",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: 18,
           text: "Recruit 8,000 more full-time, fully warranted police officers",
           type: .rights,
           parties: [.conservatives]),

    Policy(id: 19,
           text: "Invest £36 billion in local roads, rail and buses, funded by cancelling the second phase of HS2",
           type: .infrastructure,
           parties: [.conservatives]),

    Policy(id: 20,
           text: "Reverse the London Mayor’s ULEZ expansion",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: 21,
           text: "Require local referendums for new 20mph zones and Low Traffic Neighbourhoods",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: 22,
           text: "Introduce a legal target and additional investment for food security",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: 23,
           text: "Protect agricultural land from solar farms",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: 24,
           text: "Cut Foreign Aid by 50%",
           type: .foreignAffairs,
           parties: [.reform]),

    Policy(id: 25,
           text: "Increase the personal tax allowance to £20,000",
           additionalInfo: """
           This would save £1,500 per year for workers that earn more than £20,000 and mean that 7 million people no longer pay any income tax.
           """,
           type: .economy,
           parties: [.reform]),

    Policy(id: 26,
           text: "Scrap VAT on energy bills",
           type: .economy,
           parties: [.reform]),

    Policy(id: 27,
           text: "Abolish inheritance tax for all estates worth less than £2M",
           type: .economy,
           parties: [.reform]),

    Policy(id: 28,
           text: "Restart the VAT refund scheme for international tourists",
           type: .economy,
           parties: [.reform]),

    Policy(id: 29,
           text: "Abolish Stamp Duty for homes up to £750,000",
           type: .economy,
           parties: [.reform]),
    
    Policy(id: 30,
           text: "All water bosses to take a dip in British Rivers, to see how they like it",
           type: .environment,
           parties: [.binface]),
    
    Policy(id: 31,
           text: "National Service to be introduced for all former prime ministers",
           type: .rights,
           parties: [.binface]),
    
    Policy(id: 32,
           text: "WiFi on trains that works",
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 33,
           text: "Trains that work",
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 34,
           text: "Reintroduce Ceefax",
           additionalInfo: """
           Ceefax was the world’s first teletext information service and a forerunner to the current BBC Red Button service.
           """,
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 35,
           text: "Children in Need to finally get round to fixing Pudsey’s eye",
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 36,
           text: "Traffic on Northallerton High Street to be fixed by a new space bridge, bypassing both level crossings",
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 37,
           text: "European countries to be invited to join the UK, creating a new ‘Union of Europe’",
           type: .foreignAffairs,
           parties: [.binface]),
    
    Policy(id: 38,
           text: "Wallace and Gromit to be knighted, for services to Wensleydale",
           type: .constitutional,
           parties: [.binface]),
    
    Policy(id: 39,
           text: "Build at least one affordable house",
           type: .families,
           parties: [.binface]),
    
    Policy(id: 40,
           text: "Croissants to be price-capped at £1.10 and 99 flakes to cost 99p",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 41,
           text: "National Yorkshire Pudding Day to be a bank holiday (except for banks)",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 42,
           text: "Ban loud snacks from cinemas and theatres",
           type: .families,
           parties: [.binface]),
    
    Policy(id: 43,
           text: "Pensions to be double-locked, but with a little extra chain on the side",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 44,
           text: "Claudia Winkleman’s fringe to be Grade 1-listed",
           type: .constitutional,
           parties: [.binface]),
    
    Policy(id: 45,
           text: "A new series of Gladiators to feature '90s Gladiators against age-appropriate contenders",
           type: .constitutional,
           parties: [.binface]),
    
    Policy(id: 46,
           text: "Minsters' pay to be tied to that of nurses for the next 100 years",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 47,
           text: "Shops that play Christmas music before December to be closed down and turned into public libraries",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 48,
           text: "To combat the UK’s increasingly wet climate, all British citizens to be offered stilts",
           type: .environment,
           parties: [.binface]),
    
    Policy(id: 49,
           text: "Ban on speakerphones on public transport. Offenders to be forced to live with Matt Hancock for a year",
           type: .rights,
           parties: [.binface]),
    
    Policy(id: 50,
           text: "The mini golf course at Richmond swimming pool to host the open championship",
           type: .economy,
           parties: [.binface]),
    
    Policy(id: 51,
           text: "MPs to live in the area they wish to serve for 4 years before election, to improve local representation",
           type: .constitutional,
           parties: [.binface]),
    
    Policy(id: 52,
           text: "The hand dryer in the gents’ urinals at The Crown & Treaty, Uxbridge to be moved to a more sensible position.",
           type: .infrastructure,
           parties: [.binface]),
    
    Policy(id: 53,
           text: "Count Binface to represent the uk at eurovision",
           type: .foreignAffairs,
           parties: [.binface]),
]
// swiftlint:enable line_length
