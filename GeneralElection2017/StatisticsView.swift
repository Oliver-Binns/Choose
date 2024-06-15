import Charts
import Choose
import Policies
import SwiftUI

struct Item: Identifiable {
    let type: PolicyType
    let value: Int

    var id: String {
        type.rawValue
    }
}

struct StatisticsView: View {
    let opinion: Opinion
    let data: [PolicyType: Int]

    var items: [Item] {
        data.map {
            Item(type: $0.key, value: $0.value)
        }
    }

    var body: some View {
        VStack {
            Text("You \(opinion.rawValue) on")

            if items.isEmpty {
                ContentUnavailableView("Swipe on policies to see where you \(opinion.rawValue).",
                                       systemImage: "hand.draw")
            } else {
                Chart(items) { policy in
                    SectorMark(
                        angle: .value(
                            Text(verbatim: policy.type.rawValue),
                            policy.value
                        ),
                        innerRadius: .ratio(0.6)
                    )
                    .foregroundStyle(
                        by: .value(
                            Text(verbatim: policy.type.rawValue),
                            policy.type.rawValue
                        )
                    )
                }

                .chartForegroundStyleScale(
                    domain: data.keys.map(\.rawValue),
                    range: data.keys.map { Color($0.colour) }
                )
            }
        }
        .padding()
        .padding(.bottom, 30)
    }
}

#if DEBUG
#Preview {
    VStack {
        StatisticsView(opinion: .agree, data: [
            .constitutional: 3,
            .defence: 4,
            .economy: 2,
            .education: 9
        ])

        StatisticsView(opinion: .agree, data: [:])
    }
}
#endif
