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
           parties: [.reform])
]
// swiftlint:enable line_length
