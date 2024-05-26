
'''
' Focus on AES encryption.
'''

## LIBRARIES ##

from Crypto.Cipher import AES                                           # requires "pip install pycryptodome"
from Crypto.Random import get_random_bytes

## PARAMETERS ##

mode = AES.MODE_GCM                                                     # AES mode (choose "EAX" or "GCM")
key_len = 32                                                            # Key length [B] >> shall be 16, 24 or 32-byte long
debug_flag = False

## CONSTANTS ##

tag_len = 16                                                            # Tag length [B] -> fixed by AES standard
nonce_len = 16                                                          # Nonce length [B] -> fixed by AES standard


## FUNCTIONS ##

def tx_encapsulation( enc_msg, tag, nonce ) :
  ''' Function encapsulating message in TX (assuming protocol as in NOTE#3). '''
  cha_msg = tag+enc_msg+nonce
  return cha_msg

def rx_decapsulation( cha_msg ) :
  ''' Function decapsulating message in RX (assuming protocol as in NOTE#3). '''
  tag = cha_msg[:tag_len]
  enc_msg = cha_msg[tag_len:-nonce_len]
  nonce = cha_msg[-nonce_len:]
  return enc_msg, tag, nonce


## PROCESSING ##

''' TX '''
key = get_random_bytes(key_len)                                         # generate provate key
cipher_tx = AES.new(key,mode)
fid = open("git_notes_lnx.txt",'r')
src_msg = fid.read()
fid.close()
#src_msg = 'This is my hardcoded message!'                               # uncomment this line to hardcode a message insted of loading it from an external .txt file
src_msg = src_msg.encode('utf-8')
enc_msg_tx, tag_tx = cipher_tx.encrypt_and_digest(src_msg)
cha_msg_tx = tx_encapsulation(enc_msg_tx,tag_tx,cipher_tx.nonce)
''' Channel '''
cha_msg_rx = cha_msg_tx                                                 # simulate no corruption over the channel
#enc_msg_tx = get_random_bytes(len(enc_msg_tx))                          # simulate data corruption over the channel
''' RX '''
enc_msg_rx, tag_rx, nonce_rx = rx_decapsulation(cha_msg_rx)             # see NOTE#1 andNOTE#2
cipher_rx = AES.new(key,mode,nonce_rx)
dec_msg = cipher_rx.decrypt_and_verify(enc_msg_tx,tag_rx)


## RESULTS ##

# print debug data on terminal
if debug_flag :
  print('\n >> Tx')
  print(' § ENC = '+str(enc_msg_tx))
  print(' § TAG = '+str(tag_tx))
  print(' § NON = '+str(cipher_tx.nonce))
  print(' § CHA = '+str(cha_msg_tx))
  print('\n'+40*'-')
  print('\n >> Rx')
  print(' § CHA = '+str(cha_msg_rx))
  print(' § NON = '+str(nonce_rx))
  print(' § TAG = '+str(tag_rx))
  print(' § ENC = '+str(enc_msg_rx))
  print(' § TAG = '+str(tag_rx))
  print('\n >> Recovered message = '+dec_msg.decode('utf-8'))
  print('\n'+40*'-')

# perform equality chech between TX and RX data
equality_res = (src_msg==dec_msg)
print('\n >> Equality check: '+str(equality_res))

# save encrypted message to be actually tramsitted over the channel
with open("enc_msg_tx.txt",'w') as fid :
  fid.write(str(enc_msg_tx))


## NOTES ##

# 1. The "nonce" is a 16-byte one-shot cipher-key shared between TX and RX that works along with the official key to
#    encrypt/decrypt a single message. Contrary to the key, a new nonce shall be used for every message transmitted
#    in order to avoid encryption vulnerability. The nonce can be either known a-priori by the RX (e.g. agreeing the
#    same algorithm or approach to update it upon each message) or not (e.g. agreeing this will be padded, of course
#    unencrypted, in a certain position of each message, which could again change in time, for example, once a day,
#    following an agreed scheme).

# 2. The "tag" (aka "MAC") is a 16-byte checksum shared between TX and RX that assures data-integrity. This results
#    from and represents the specific key and source message used as input in the TX. A mismatch between TX and RX
#    tags or encrypted data causes a "MAC check failed" error (the latter can be tested by uncommenting the channel
#    line above, the former by using "tag_rx = get_random_bytes(len(tag_tx))"). The tag shall be necessarily
#    part of the transmitted message (usually at a specified index agreeed between TX and RX) and clear (i.e. not
#    encoded), but cannot be known a-priori by the RX (since it depends by the message content itself).

# 3. The arbitrary protocol implemented here simply consists in padding the tag and the nonce respectively at the
#    beginning and atthe end of the message. This encapsulation/decapsulation strategy shall be shared adn known at
#    both TX and RX sides.

# 4. Extras:
#    - for more info see: https://onboardbase.com/blog/aes-encryption-decryption/


## @todo ##

# - try saving encryption elements (key, nonce and tag) into .env file (really needed and safe?);
# - implement protocol to automatically find tag and nonce at RX (e.g. at index 0 or 100, and force message to have
#   a fixed and large length not to overflow);
# - try 2-layers encryption (i.e. GCM inside AEX).
