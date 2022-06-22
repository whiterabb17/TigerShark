#!env python3
from twilio.rest import Client
import base64
import argparse
import time
import sqlite3


#parse command line args
parser = argparse.ArgumentParser()
parser.add_argument("campaign_name_p", help="Enter exactly what you named the campaign in Gophish")
args = parser.parse_args()

# Find these values at https://twilio.com/user/account
account_sid = 'getfromtwillio'
auth_token = 'getfromtwillio'
client = Client(account_sid, auth_token)


#this number must be owned by your twilio account
fromNumber = '+getfromtwillio'


#create sql connection and cursor object
#may need to update db location
conn = sqlite3.connect('/root/go/src/github.com/gophish/gophish/gophish.db')
conn.text_factory = str

#get campaign details
d = conn.cursor()
campaign_name = (args.campaign_name_p,)
campaign_id_query = d.execute('SELECT id FROM campaigns WHERE name=?',campaign_name)
c_id = d.fetchone()
d.close()

#get url from campaign
#the payload (keep it short, 160 char limit)
f = conn.cursor()
url_query = f.execute('SELECT url FROM campaigns WHERE id=?',c_id)
url = f.fetchone()
url = url[0]

#get the message text
g = conn.cursor()
messageid_query = g.execute('SELECT template_id FROM campaigns WHERE id=? AND status="In progress"', c_id)
message_id = g.fetchone()
g.close()

n = conn.cursor()
messagetext_query = n.execute('SELECT text FROM templates where id=?',message_id)
message_text =  n.fetchone()
message_text = message_text[0]
n.close


payloadText = '{{message_text}}'
secure_url = '/?secure_id='

#get addresses from the campaign
#addresses need to be in the format g+15559876879@guest.guest - essentially,replace the phone number an leave the rest
e = conn.cursor()
email_address_query = e.execute('SELECT email FROM events WHERE campaign_id=? AND email IS NOT "" AND message="Email Sent" ' ,c_id)
email_address = e.fetchall()
e.close()

# the big loopdeloop
for address in email_address:
#querying for the rid
    c = conn.cursor()
    queryvar = (address[0],)
    rid_query = c.execute('SELECT r_ID FROM results WHERE email=? AND campaign_id=?', queryvar + c_id)
    secure_id = c.fetchone()
#mashing this into a string
    secure_id = str(secure_id)
    secure_id = secure_id.replace('(\'','')
    secure_id = secure_id.replace('\',)','')

#address stuff
    address = address[0]
    address = address.replace('g','')
    address = address.replace('@uest.uest','')
    time.sleep(1)

#buil up the payload
    payloadFinal = payloadText.replace('{{message_text}}', message_text)
    payloadFinal = payloadFinal.replace('(URLPAYLOAD)', url+secure_url+secure_id)

#send the message
    targetNumber = address
    message = client.api.account.messages.create(to=targetNumber,from_=fromNumber,body=payloadFinal)
    print('sent payload to {} with secure_id {}'.format(targetNumber.rstrip(),secure_id.rstrip()))
    print(payloadFinal)
    c.close()

#close db connection
conn.close()