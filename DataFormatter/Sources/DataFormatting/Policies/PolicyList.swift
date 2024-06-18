import Foundation
import Parties
import Policies

typealias Policy = PolicyLite

// swiftlint:disable line_length file_length
let policies: [PolicyLite] = [
    Policy(id: "4303665D-F4B0-41A5-ABB3-790677B5DD7E",
           text: "Cut national insurance by 2p",
           additionalInfo: """
           This is worth £450 per year for the average worker on £35,000.
           """,
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "40FF1752-0E42-4073-860D-0DA17CF55787",
           text: "Abolish the main rate of National Insurance for the self-employed",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "652ED9B3-F747-47A0-AD18-F3742399769F",
           text: "Introduce a pension Triple Lock Plus",
           additionalInfo: """
           The means the personal allowance for pensioners will always rise with inflation, earnings or 2.5%, whichever is higher.
           This is already the case for the State Pension.
           """,
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "84CD663D-DBD7-4ED2-BCF2-75D5FC06FA7B",
           text: "30 hours a week free childcare when a 9 months of age until they start school",
           type: .families,
           parties: [.conservatives]),

    Policy(id: "76F0D4BF-B285-464E-8966-A042CFDEB86E",
           text: "Move to a household system for child benefit",
           additionalInfo: """
           This would mean that child benefit is calculated based on a total household income, rather than thresholds for individual earners.
           It will benefit families that have a single main earner.
           """,
           type: .families,
           parties: [.conservatives]),

    Policy(id: "E147D3F7-5275-40A9-B866-3FB75F7B033E",
           text: "No new green levies or charges to be introduced",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: "1AF6B10F-D5A8-41C8-8122-382F096DD417",
           text: "Introduce a mandatory National Service for all school leavers at 18",
           additionalInfo: """
           The National Service would allow a choice between a competitive placement in the military or civic service roles.
           """,
           type: .rights,
           parties: [.conservatives]),

    Policy(id: "8E204050-1E27-4FFB-B217-B33D28560ABA",
           text: "Fund 100,000 high-quality apprenticeships by curbing the number of poor-quality university degrees",
           type: .education,
           parties: [.conservatives]),

    Policy(id: "29A7E99C-D720-4196-958C-BC6C2929AE52",
           text: "Ban the use of mobile phones during the school day",
           type: .education,
           parties: [.conservatives]),

    Policy(id: "8BFE5EFF-F293-4825-9760-4CF3669C6BF3",
           text: "Ensure parents can see what their children are being taught, especially on sensitive matters like sex education",
           type: .education,
           parties: [.conservatives]),

    Policy(id: "B153B85C-FC5A-4D36-A78C-17E89CD3E071",
           text: "Introducing the Advanced British Standard which combines A-Levels and T-Levels for 16-19 year olds",
           type: .education,
           parties: [.conservatives]),

    Policy(id: "1FFDAB99-BAF1-40A7-8328-2E2E1FF87E77",
           text: "Increase defence spending to the 2.5% of GDP by 2030",
           type: .defence,
           parties: [.conservatives]),

    Policy(id: "7BD49969-20B2-41B7-B13F-4C302E411214",
           text: "Introduce a legal cap on migration to guarantee that numbers will fall every year",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "60C25622-8440-4B1E-8936-B44BD7B276DE",
           text: "Deport illegal immigrants to Rwanda",
           additionalInfo: """
           The Rwanda deportation scheme involves the UK government sending asylum seekers to Rwanda for processing and settlement, aiming to deter illegal immigration and human trafficking.
           """,
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "068BE19B-1787-4B10-8436-B2EC5AFCB628",
           text: "Work with other countries to rewrite international asylum treaties",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "23DC58F9-B535-488B-8D99-5DA82CBCB39E",
           text: "Increase NHS spending above inflation every year",
           type: .healthSocialCare,
           parties: [.conservatives]),

    Policy(id: "435FEE43-40C4-4B93-BEB6-75D345B0AEEE",
           text: "Rewrite the Equality Act to define sex as biological sex",
           type: .rights,
           parties: [.conservatives]),

    Policy(id: "F1227C23-B652-4C30-8344-E369B9D7F3DE",
           text: "Abolish Stamp Duty for homes up to £425,000 for first time buyers",
           type: .economy,
           parties: [.conservatives]),

    Policy(id: "2B3C53EA-93E3-4E74-9AAB-CA033E9B76CB",
           text: "Recruit 8,000 more full-time, fully warranted police officers",
           type: .rights,
           parties: [.conservatives]),

    Policy(id: "60B3F894-E5CC-47F8-9AEE-3C1D02252537",
           text: "Invest £36 billion in local roads, rail and buses, funded by cancelling the second phase of HS2",
           type: .infrastructure,
           parties: [.conservatives]),

    Policy(id: "144368F0-7DF3-4153-A4F9-FCF7257A4019",
           text: "Reverse the London Mayor’s ULEZ expansion",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: "C7C99241-3E45-41DF-AAC6-1F2A1B11B8E7",
           text: "Require local referendums for new 20mph zones and Low Traffic Neighbourhoods",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: "38632A7E-BE2D-4F83-A65A-5A4A610375FD",
           text: "Introduce a legal target and additional investment for food security",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: "28D0ED80-5450-4B25-9832-83890678259E",
           text: "Protect agricultural land from solar farms",
           type: .environment,
           parties: [.conservatives]),

    Policy(id: "F40558A2-D80E-48D5-B8B0-EFB46B51452E",
           text: "Cut Foreign Aid by 50%",
           type: .foreignAffairs,
           parties: [.reform]),

    Policy(id: "702F60EA-D35A-4AFA-847E-5F30B3ABB4FD",
           text: "Increase the personal tax allowance to £20,000",
           additionalInfo: """
           This would save £1,500 per year for workers that earn more than £20,000 and mean that 7 million people no longer pay any income tax.
           """,
           type: .economy,
           parties: [.reform]),

    Policy(id: "100048E7-B22A-4778-A36A-551E1EFBE37F",
           text: "Scrap VAT on energy bills",
           type: .economy,
           parties: [.reform]),

    Policy(id: "91695C98-24C9-4D88-8797-4B01F81DA8E5",
           text: "Abolish inheritance tax for all estates worth less than £2M",
           type: .economy,
           parties: [.reform]),

    Policy(id: "13C40E52-E697-4736-8B7A-99209E0CFFBB",
           text: "Restart the VAT refund scheme for international tourists",
           type: .economy,
           parties: [.reform]),

    Policy(id: "16F827AA-5977-4942-AA54-3C6EFCDCD588",
           text: "Abolish Stamp Duty for homes up to £750,000",
           type: .economy,
           parties: [.reform]),

    Policy(id: "33D2B67E-E6CA-4AF2-9AE8-672D6E9D3E3F",
           text: "All water bosses to take a dip in British Rivers, to see how they like it",
           type: .environment,
           parties: [.binface]),

    Policy(id: "DF50BF62-9E39-4EBF-AC81-CC4555F0746F",
           text: "National Service to be introduced for all former prime ministers",
           type: .rights,
           parties: [.binface]),

    Policy(id: "F8B128DA-0481-4E73-A34F-9B417606A155",
           text: "WiFi on trains that works",
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "49944B9B-8749-4066-A6D2-3BB4C36EF7FE",
           text: "Trains that work",
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "86BF0D6E-5695-46A6-8F41-48AA00F9BE64",
           text: "Reintroduce Ceefax",
           additionalInfo: """
           Ceefax was the world’s first teletext information service and a forerunner to the current BBC Red Button service.
           """,
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "E269BE0E-B418-465A-A784-036A787E080D",
           text: "Children in Need to finally get round to fixing Pudsey’s eye",
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "D8BFB805-ECD9-4C84-B8C1-6EEBDCED37BF",
           text: "Traffic on Northallerton High Street to be fixed by a new space bridge, bypassing both level crossings",
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "9DBE8FFA-B66E-401C-BAA4-3E59FA3C588F",
           text: "European countries to be invited to join the UK, creating a new ‘Union of Europe’",
           type: .foreignAffairs,
           parties: [.binface]),

    Policy(id: "5FBE8A0D-631D-46BD-862D-2E701F45F7D5",
           text: "Wallace and Gromit to be knighted, for services to Wensleydale",
           type: .constitutional,
           parties: [.binface]),

    Policy(id: "0312CA93-2429-41D3-99A7-24C725B0E0A4",
           text: "Build at least one affordable house",
           type: .families,
           parties: [.binface]),

    Policy(id: "05F7574B-CA83-48EC-A141-AF2A9172DD85",
           text: "Croissants to be price-capped at £1.10 and 99 flakes to cost 99p",
           type: .economy,
           parties: [.binface]),

    Policy(id: "0D7CF2CB-2AE4-4FE6-8EAC-A233D94687F0",
           text: "National Yorkshire Pudding Day to be a bank holiday (except for banks)",
           type: .economy,
           parties: [.binface]),

    Policy(id: "C2E3ECD1-EC46-4129-99D6-7ACF7F7A3330",
           text: "Ban loud snacks from cinemas and theatres",
           type: .families,
           parties: [.binface]),

    Policy(id: "2460A52F-A842-4A92-A371-E9F59AFC36AC",
           text: "Pensions to be double-locked, but with a little extra chain on the side",
           type: .economy,
           parties: [.binface]),

    Policy(id: "AE0BEBBD-2473-4BC3-AB79-2506108A3085",
           text: "Claudia Winkleman’s fringe to be Grade 1-listed",
           type: .constitutional,
           parties: [.binface]),

    Policy(id: "9FB97E29-3E96-49CA-A189-0E691DCDC483",
           text: "A new series of Gladiators to feature '90s Gladiators against age-appropriate contenders",
           type: .constitutional,
           parties: [.binface]),

    Policy(id: "4BA1A160-422C-416F-99AD-DAA261CE6AE0",
           text: "Minsters' pay to be tied to that of nurses for the next 100 years",
           type: .economy,
           parties: [.binface]),

    Policy(id: "5C6C494A-371A-43FE-8331-194612846ED1",
           text: "Shops that play Christmas music before December to be closed down and turned into public libraries",
           type: .economy,
           parties: [.binface]),

    Policy(id: "D3366887-2CCC-48BD-9A31-6B4DF0A4B216",
           text: "To combat the UK’s increasingly wet climate, all British citizens to be offered stilts",
           type: .environment,
           parties: [.binface]),

    Policy(id: "196C1355-1E89-4977-961E-C1D12433D61F",
           text: "Ban on speakerphones on public transport. Offenders to be forced to live with Matt Hancock for a year",
           type: .rights,
           parties: [.binface]),

    Policy(id: "8B12E185-1D19-43EB-BC67-6D2A6EA6A99A",
           text: "The mini golf course at Richmond swimming pool to host the open championship",
           type: .economy,
           parties: [.binface]),

    Policy(id: "BC8EF51A-5933-4128-9BC7-F5E835F7A8A9",
           text: "MPs to live in the area they wish to serve for 4 years before election, to improve local representation",
           type: .constitutional,
           parties: [.binface]),

    Policy(id: "92209C21-28D8-4055-A0F5-A8DA3616752C",
           text: "The hand dryer in the gents’ urinals at The Crown & Treaty, Uxbridge to be moved to a more sensible position.",
           type: .infrastructure,
           parties: [.binface]),

    Policy(id: "E8BDA16F-EDD9-482F-9528-3F2A21920B89",
           text: "Count Binface to represent the UK at Eurovision",
           type: .foreignAffairs,
           parties: [.binface]),

    Policy(id: "19A4E401-A385-49B0-B461-ACDE5F559779",
           text: "Abolish IR35 rules for contractors",
           type: .economy,
           parties: [.reform]),

    Policy(id: "6B4C3C36-9A1B-44F0-9A5E-AF0C8821832A",
           text: "Leave the European Convention on Human Rights",
           type: .rights,
           parties: [.reform]),

    Policy(id: "FA530698-6849-481D-9897-917535310B76",
           text: "Reduce the main corporation tax rate from 25% to 20%",
           type: .economy,
           parties: [.reform]),

    Policy(id: "E7875BF4-E391-4519-97F8-35509F7A6980",
           text: "All frontline NHS and social care staff to pay zero basic rate tax for 3 years",
           type: .healthSocialCare,
           parties: [.reform]),

    Policy(id: "73F85781-5483-4C41-8326-BC2D17282B73",
           text: "Give patients vouchers for private healthcare if they can't see a GP within 3 days",
           type: .healthSocialCare,
           parties: [.reform]),

    Policy(id: "D7C61AA0-628A-408F-BBE7-7EBC4CDA144B",
           text: "Scrap Net Zero targets and Related Subsidies",
           type: .environment,
           parties: [.reform]),

    Policy(id: "7A80AC76-A3F5-47BA-B8DC-A0BB55C75421",
           text: "Scrap interest on student loans and extend loan repayment periods to 45 years",
           type: .education,
           parties: [.reform]),

    Policy(id: "C417DD41-636D-4124-BAC7-C94B063F2593",
           text: "Ban transgender ideology in primary and secondary schools",
           type: .education,
           parties: [.reform]),

    Policy(id: "F4C75FE2-AEBC-43AB-81D9-67F90CD9D8E1",
           text: "Ban critical race theory in primary and secondary schools",
           type: .education,
           parties: [.reform]),

    Policy(id: "CC314C6D-447B-4F82-B649-34AFE27CE13B",
           text: "Abandon the Windsor Framework",
           additionalInfo: """
           The Windsor Framework simplifies trade rules between Northern Ireland and the rest of the UK while preserving Northern Ireland's access to the EU market.
           """,
           type: .foreignAffairs,
           parties: [.reform]),

    Policy(id: "3B4248A4-5DDE-4A87-9C14-8CAE6395BFF8",
           text: "Mandate single sex spaces",
           additionalInfo: "Public toilets and changing areas must provide single sex facilities, including in schools.",
           type: .foreignAffairs,
           parties: [.reform]),

    Policy(id: "3473F2D0-0101-4610-B521-DC670A4AB00C",
           text: "Ban all ULEZ and Low Traffic Neighbourhoods",
           type: .foreignAffairs,
           parties: [.reform]),

    Policy(id: "F15F3590-1202-4C2E-9776-7F2C0A9DA411",
           text: "Stop postal voting except for the elderly, disabled or those who can’t leave their homes.",
           type: .constitutional,
           parties: [.reform]),

    Policy(id: "5D70A479-5519-4F4D-97F8-E9F4408F4F8E",
           text: "Introduce proportional representation voting for the House of Commons",
           additionalInfo: """
           Proportional representation allocates legislative seats based on vote percentages, aiming for fairness, but it can lead to unstable coalition governments.
           """,
           type: .constitutional,
           parties: [.reform]),

    Policy(id: "73947F6B-A904-4667-AD25-D8C06940513F",
           text: "Keep the corporation tax rate at 25%",
           type: .economy,
           parties: [.labour, .conservatives]),

    Policy(id: "4BBF96B4-0EC6-43F4-8328-BF920C77FE5F",
           text: "Double the number of NHS CT and MRI scanners",
           type: .healthSocialCare,
           parties: [.labour]),

    Policy(id: "69A20F2D-E630-4594-8D02-6AF1D12AA2F3",
           text: "Free breakfast clubs in every primary school",
           type: .education,
           parties: [.labour]),

    Policy(id: "E64EE420-506B-4FF7-B96E-9E1741822213",
           text: "Apply VAT and business rates to private school fees",
           type: .education,
           parties: [.labour]),

    Policy(id: "AE7781B9-AE25-429A-91E7-0EE83345054E",
           text: "Scrap the Rwanda deportation scheme",
           additionalInfo: """
           The Rwanda deportation scheme involves the UK government sending asylum seekers to Rwanda for processing and settlement, aiming to deter illegal immigration and human trafficking.
           """,
           type: .economy,
           parties: [.labour]),

    Policy(id: "06197729-1718-4F9E-9DB3-8BC010624077",
           text: "Invest £855m in HMRC to reduce tax avoidance",
           type: .economy,
           parties: [.labour]),

    Policy(id: "5B258ACA-82EA-497D-8338-F0CDB3D0FFB9",
           text: "Open an additional 3,000 nurseries",
           type: .families,
           parties: [.labour]),

    Policy(id: "A87B3138-55B7-4B83-B32C-5644588422BB",
           text: "Abolish Section 21 ‘no fault’ evictions",
           additionalInfo: """
           Section 21 allows landlords in England and Wales to evict tenants without providing a reason.
           """,
           type: .rights,
           parties: [.labour]),

    Policy(id: "E3798712-F588-4C55-9E0B-A7643403FAA4",
           text: "Lower the voting age to 16",
           type: .rights,
           parties: [.labour]),

    Policy(id: "EBC431EA-00BE-4F5D-8968-11B982FB7891",
           text: "Ban advertising junk food to children along with the sale of high-caffeine energy drinks to under-16s",
           type: .rights,
           parties: [.labour]),

    Policy(id: "A624EC28-2292-4DD7-856B-5274FD93AB54",
           text: "Set up Great British Energy, a publicly-owned clean power company",
           additionalInfo: """
           Great British Energy aims to cut bills for good and boost energy security, paid for by a windfall tax on oil and gas giants.
           """,
           type: .environment,
           parties: [.labour]),

    Policy(id: "0B15D291-62A6-4AC0-BE0D-EAFB174D8809",
           text: "Recruit 6,500 new teachers in key subjects",
           additionalInfo: """
           New teachers in key subjects will aim to prepare children for life, work and the future, paid for by ending tax breaks for private schools.
           """,
           type: .environment,
           parties: [.labour]),

    Policy(id: "E159510B-FB3F-4F07-AFCC-5A01934AD366",
           text: "No increases to national insurance, income tax or VAT",
           type: .economy,
           parties: [.labour]),

    Policy(id: "7E691212-5BF1-4C32-B942-5E5650FB3BBB",
           text: "Fix an additional 1 million potholes per year across England",
           additionalInfo: """
           This will be funded by deferring the A27 bypass.
           """,
           type: .economy,
           parties: [.labour]),

    Policy(id: "1D797544-A723-499C-99F5-3E0E36003B1F",
           text: "Reforming the railways and bring them into public ownership",
           additionalInfo: """
           Railways will be brought back into public ownership as contracts with existing operators expire or are broken through a failure to deliver.
           """,
           type: .infrastructure,
           parties: [.labour]),

    Policy(id: "83AE5B91-E209-49F8-9E9A-5C0FE558E248",
           text: "Build 1.5 million new homes",
           type: .families,
           parties: [.labour, .conservatives]),

    Policy(id: "F804DBC6-9BA3-493F-BAA3-77EAF01D6DE6",
           text: "Put failing water companies under special measures to clean up our water",
           additionalInfo: """
           Give regulators new powers to block the payment of bonuses to executives who pollute our waterways.

           Bring criminal charges against persistent law breakers.
           """,
           type: .environment,
           parties: [.labour]),

    Policy(id: "8BB4EDA1-80BB-4129-8FC3-02D399D06D38",
           text: "Ban trail hunting and the import of hunting trophies",
           type: .environment,
           parties: [.labour]),

    Policy(id: "4EBE8B36-9648-49DD-97F7-AFC6F0B352E6",
           text: "Introduce new laws to crack down on puppy smuggling",
           type: .environment,
           parties: [.labour, .conservatives, .liberalDemocrats]),

    Policy(id: "2D43A691-E746-44E2-A88C-308152010977",
           text: "Ban so-called conversion therapy",
           additionalInfo: """
           "So-called conversion therapy" refers to practices aimed at changing an individual's sexual orientation or gender identity.
           """,
           type: .rights,
           parties: [.labour, .liberalDemocrats])
]
// swiftlint:enable line_length
