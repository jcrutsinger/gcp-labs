import json
with open('tf-cred.json', 'r') as f:
    credentials = json.load(f)
    
one_line_credentials = json.dumps(credentials)
print(one_line_credentials)
