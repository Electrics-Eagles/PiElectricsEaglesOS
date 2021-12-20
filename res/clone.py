import json 
import requests
import datetime
import requests
import zipfile
r = requests.get('https://api.github.com/repos/Electrics-Eagles/PiElectricsEagles-dev/actions/artifacts')
print("**** PIELECTRICSEAGLES BUILDROOT PLUGIN *****")
date=datetime.datetime.now()
print(f"**** at: {date} Clone json *****")
artifact_json=json.loads(r.text)
print(f"**** at: {date} json loaded  *****")
artifact_id=artifact_json['artifacts'][0]['id']
url = f"https://nightly.link/Electrics-Eagles/PiElectricsEagles-dev/actions/artifacts/{artifact_id}.zip"
response = requests.get(url, stream=True)
with open("bin.zip", "wb") as handle:
    for data in (response.iter_content()):
        handle.write(data)
zip = zipfile.ZipFile('bin.zip')
zip.extractall()
print(f"**** at: {date} Cloned ok ****")
