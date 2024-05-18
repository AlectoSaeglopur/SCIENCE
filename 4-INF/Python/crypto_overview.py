
'''
' Overview of x3 encryption algorithms.
'''

## LIBRARIES ##

from cryptography.fernet import Fernet                                              # requires "pip install cryptography"
from Crypto.Cipher import AES                                                       # requires "pip install pycryptodome"
import rsa                                                                          # requires "pip install rsa"


## PROCESSING ##

# 0. Source
separ_string = '\n'+30*'-'+'\n'
src_msg = "Some of those that work forces are the same that burn crosses."          # source message
print(">> Original message:\n"+src_msg)
print(separ_string)

# 1. Symmetric-key encryption (Fernet) -> easy and fast, but less secure
fernet_key = Fernet.generate_key()                                                  # generate key (or manually specify that, e.g. b're45dwhTh3dghjdhg!rQSRrWErrjd4hgjdghOghjdgh=')
fernet = Fernet(fernet_key)                                                         # instance Fernet class with the key
enc_msg1 = fernet.encrypt(src_msg.encode())
dec_msg1 = fernet.decrypt(enc_msg1).decode()
print("§ 1. SYMMETRIC-KEY ENCRYPTION (Fernet)\n")
print(">> Key = "+str(fernet_key)+" | "+str(len(fernet_key))+"\n")
print(">> Encrypted message:\n"+str(enc_msg1)+"\n")
print(">> Decrypted message:\n"+dec_msg1)
print(separ_string)

# 2. Asymmetric-key encryption (RSA) -> slower but safer
rsa_key_length = 1500                                                               # key length [B] ->  NB: the longer, the slower but safer (minimum value = 16)
[rsa_public_key, rsa_private_key] = rsa.newkeys(rsa_key_length)                     # generate public and private keys by specifying their length as input 
enc_msg2 = rsa.encrypt(src_msg.encode(),rsa_public_key)                             # encrypt message through public key (with message first encoded as byte-string)
dec_msg2 = rsa.decrypt(enc_msg2,rsa_private_key).decode()                           # decrypt message through private key (with message then decoded as char-string)
print("§ 2. ASYMMETRIC-KEY ENCRYPTION (RSA)\n")
print(">> Encrypted message:\n"+str(enc_msg2)+"\n")
print(">> Decrypted message:\n"+dec_msg2)
print(separ_string)

# 3. Symmetric-key encryption (AES) -> better, de-facto standard
aes_mode = AES.MODE_GCM                                                             # AES mode (choose "EAX" or "GCM")
aes_key = b'MyNameIsFilippo!HopeYourefineYO!'                                       # NB: key shall be 16, 24 or 32-byte long
aes_len = 8*len(aes_key)
eas_cipher_tx = AES.new(aes_key,aes_mode)
enc_msg3, aes_tag_tx = eas_cipher_tx.encrypt_and_digest(src_msg.encode('ascii'))    # message needs to be converted to byte string (i.e. equivalent to: b'Some of those that ...')
aes_tag_rx = aes_tag_tx
aes_nonce_rx = eas_cipher_tx.nonce
eas_cipher_rx = AES.new(aes_key,aes_mode,aes_nonce_rx)
dec_msg3 = eas_cipher_rx.decrypt_and_verify(enc_msg3,aes_tag_rx)
print("§ 3. SYMMETRIC-KEY ENCRYPTION (AES-"+str(aes_len)+")\n")
print(">> Encrypted message:\n"+str(enc_msg3)+"\n")
print(">> Decrypted message:\n"+dec_msg3.decode('utf-8'))
