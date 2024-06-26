import Choose
import Constituencies
import Parties
import Policies
import SwiftData
import SwiftUI

struct PolicyGroups {
    var groups: [PolicyType: Int]
    var count: Int {
        groups.values.reduce(0, +)
    }

    init(policies: [Policy]) {
        groups = Dictionary(policies.map { ($0.type, 1) },
                            uniquingKeysWith: +)
    }
}

struct PartyMapping {
    let agreement: PolicyGroups
    let disagreement: PolicyGroups

    init(likedPolicies: [Policy],
         dislikedPolicies: [Policy]) {
        agreement = PolicyGroups(policies: likedPolicies)
        disagreement = PolicyGroups(policies: dislikedPolicies)
    }

    var ratio: Double {
        let likedCount = Double(agreement.count)
        let dislikedCount = Double(disagreement.count)
        return likedCount / max(likedCount + dislikedCount, .leastNonzeroMagnitude)
    }
}

struct PartiesView: View {
    let candidates: [Candidate]

    @Environment(\.modelContext)
    private var context

    @Environment(MatchViewModel<Policy>.self)
    private var matchService

    var body: some View {
        let (likedPolicies, dislikedPolicies) = policyOpinions

        let agreement = { (party: Party) -> PartyMapping in
            let likedPolicies = likedPolicies.filter { $0.parties.contains(party) }
            let dislikedPolicies = dislikedPolicies.filter { $0.parties.contains(party) }
            return PartyMapping(likedPolicies: likedPolicies, dislikedPolicies: dislikedPolicies)
        }

        let partyMapping = candidates.reduce(into: [:]) { partialResult, candidate in
            partialResult[candidate] = agreement(candidate.party)
        }

        let sortedCandidates = candidates.sorted { lhs, rhs in
            guard let lhs = partyMapping[lhs]?.ratio,
                  let rhs = partyMapping[rhs]?.ratio else {
                preconditionFailure("All parties should appear in this list")
            }
            return lhs > rhs
        }

        return ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(sortedCandidates) { candidate in
                    PartyView(candidate: candidate,
                              partyMapping: partyMapping[candidate]!)
                }
            }.padding()
        }
    }

    @MainActor
    var policyOpinions: ([Policy], [Policy]) {
        let likedPolicyIDs = matchService
            .opinions[.agree, default: []]
        let dislikedPolicyIDs = matchService
            .opinions[.disagree, default: []]

        do {
            let likedPredicate = #Predicate<Policy> { likedPolicyIDs.contains($0.id) }
            let likedPolicies = try context.fetch(FetchDescriptor(predicate: likedPredicate))

            let dislikedPredicate = #Predicate<Policy> { dislikedPolicyIDs.contains($0.id) }
            let dislikedPolicies = try context.fetch(FetchDescriptor(predicate: dislikedPredicate))

            return (likedPolicies, dislikedPolicies)
        } catch {
            return ([], [])
        }
    }
}

#if DEBUG
#Preview {
    PartiesView(candidates: .mock())
        .environment(MatchViewModel<Policy>())
}
#endif
