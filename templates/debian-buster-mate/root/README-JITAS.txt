How to connect to Jitas server
==============================

Unsecure link (no certificate):
  http://___HOST___/novnc/?host=___HOST___&port=6080&encrypt=0&resize=scale&password=___PASSWD___

Secure link (self-signed, needed to import the CA certificate):
  https://___HOST___/novnc/?host=___HOST___&port=6090&encrypt=1&resize=scale&password=___PASSWD___

The self-signed CA certificate (add this as a trusted CA certificate):
  http://___HOST___/jitas-ca.pem

Default VNC Password: ___PASSWD___

To change password (as jitas user): 
  su -l jitas
  x11vnc -storepasswd /home/jitas/.vnc/passwd
