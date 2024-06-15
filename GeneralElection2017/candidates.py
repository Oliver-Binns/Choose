import urllib.request, json

output_file = "candidates.json"

data_dump = {}
 
with urllib.request.urlopen("https://candidates.democracyclub.org.uk/api/next/elections/parl.2019-12-12/") as url:
    constituencies = json.loads(url.read().decode())["ballots"]
    for ballot in constituencies:
        constituency_url = ballot["url"]
        with urllib.request.urlopen(constituency_url) as url2:
            constituency_info = json.loads(url2.read().decode())
            constituency_name = constituency_info["post"]["label"]
            data_dump[constituency_name] = []
            for candidate in constituency_info["candidacies"]:
                with urllib.request.urlopen(candidate["person"]["url"]) as url3:
                    candidate_image = json.loads(url3.read().decode())["thumbnail"]
                    
                    data_dump[constituency_name].append({
                        "name": candidate["person"]["name"],
                        "image": candidate_image,
                        "party": candidate["party"]["name"],
                    })

with open(output_file, 'w') as fp:
    json.dump(data_dump, fp)
