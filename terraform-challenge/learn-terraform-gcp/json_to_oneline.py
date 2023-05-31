import json
import sys

def json_to_oneline(json_file):
    with open(json_file) as f:
        data = json.load(f)
    return json.dumps(data)
    
if __name__ == "__main__":
    json_file = sys.argv[1]
    print(json_to_oneline(json_file))
