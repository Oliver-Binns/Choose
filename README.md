# General-Election-2017

## Candidate Data

Candidate data is exported from Democracy Club's CSV export tool:

https://candidates.democracyclub.org.uk/data

It is converted from CSV to JSON using a script contained in this repository.

```bash
cd DataFormatting
swift run DataFormatting candidates candidates -o ../GeneralElection/Sources/Constituencies/Resources/candidates.json
```

## Policy Data

