import json
import csv

with open('RUS_data.json') as f:
    Russia_entries = json.load(f)


with open('Russia_entries', 'w', newline='') as file:
    filewriter = csv.writer(file)
    filewriter.writerow(['relid', 'year', 'type_of_violence', 'best'])
    for entry in Russia_entries:
        #print(entry['relid'])
        
        filewriter.writerow([entry['relid'], entry['year'], entry['type_of_violence'], entry['best']])

with open('USA_data.json') as f:
    USA_entries = json.load(f)


with open('USA_entries', 'w', newline='') as file:
    filewriter = csv.writer(file)
    filewriter.writerow(['relid', 'year', 'type_of_violence', 'best'])
    for entry in USA_entries:
        #print(entry['relid'])
        
        filewriter.writerow([entry['relid'], entry['year'], entry['type_of_violence'], entry['best']])
