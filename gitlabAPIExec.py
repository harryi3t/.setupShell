#!/usr/bin/env python
import urllib2
import urllib
import sys
import json
import os

url = "http://localhost/api/v3/";
token = "SX6LyiRdEyhwujAFahg1";

if len(sys.argv) < 2:
    sys.exit('No HTTP method passed')

method = sys.argv[1]
handler = urllib2.HTTPHandler()
opener = urllib2.build_opener(handler)

if len(sys.argv) < 3:
    sys.exit('No API method passed')
url += sys.argv[2]

data = ''
if len(sys.argv) > 3:
    try:
        sys.argv[3] = json.loads(sys.argv[3])
        data = urllib.urlencode(sys.argv[3])
        url += "?"+data
    except:
        pass

request = urllib2.Request(url)
request.add_header("Content-Type",'application/json')
request.add_header('PRIVATE-TOKEN', token)
request.get_method = lambda: method.upper()
error_message = ''
try:
    connection = opener.open(request)
except urllib2.HTTPError,e:
    connection = e
    error_message = e.read()

if connection.code < 299:
    data = connection.read()
    try:
        data = json.loads(data)
        print "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
        print "HTTP status is: " + str(connection.code)
        print "----------------------------------------"
        print json.dumps(data, indent=4, sort_keys=True)
    except:
        print data
else:
    print 'Error: ' + str(connection)
    print error_message
