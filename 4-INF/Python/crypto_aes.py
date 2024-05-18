
'''
' Focus on AES encryption.
'''

## LIBRARIES ##

from Crypto.Cipher import AES                                                       # requires "pip install pycryptodome"
from Crypto.Random import get_random_bytes

## PARAMETERS ##

aes_mode = AES.MODE_GCM                                                             # AES mode (choose "EAX" or "GCM")
aes_len = 32                                                                        # NB: key shall be 16, 24 or 32-byte long


## PROCESSING ##

''' TX '''
aes_key = get_random_bytes(aes_len)                                                 # generate provate key
eas_cipher_tx = AES.new(aes_key,aes_mode)
with open("git_notes.txt",'r') as fid :
  src_msg = fid.read()
  src_msg = src_msg.encode('utf-8')
enc_msg, aes_tag_tx = eas_cipher_tx.encrypt_and_digest(src_msg)

''' Channel '''
#enc_msg = get_random_bytes(len(enc_msg))                                            # simulate data corruption over the channel

''' RX '''
aes_tag_rx = aes_tag_tx                                                             # see NOTE#2
aes_nonce_rx = eas_cipher_tx.nonce                                                  # see NOTE#1
eas_cipher_rx = AES.new(aes_key,aes_mode,aes_nonce_rx)
dec_msg = eas_cipher_rx.decrypt_and_verify(enc_msg,aes_tag_rx)


## RESULTS ##

print(dec_msg.decode('utf-8'))
equality_res = (src_msg==dec_msg)
print("\n >>> Equality check: "+str(equality_res))

with open("src_msg.txt",'w') as fid :
  fid.write(str(src_msg))
with open("enc_msg.txt",'w') as fid :
  fid.write(str(enc_msg))
with open("dec_msg.txt",'w') as fid :
  fid.write(str(dec_msg))


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
#    line above, the former by using "aes_tag_rx = get_random_bytes(len(aes_tag_tx))"). The tag shall be necessarily
#    part of the transmitted message (usually at a specified index agreeed between TX and RX) and clear (i.e. not
#    encoded), but cannot be known a-priori by the RX (since it depends by the message content itself).

# 3. Extras:
#    - for more info see: https://onboardbase.com/blog/aes-encryption-decryption/


## @todo ##

# - try saving encryption elements (key, nonce and tag) into .env file (really needed and safe?);
# - implement protocol to automatically find tag and nonce at RX (e.g. at index 0 or 100, and force message to have
#   a fixed and large length not to overflow);
# - try 2-layers encryption (i.e. GCM inside AEX).
