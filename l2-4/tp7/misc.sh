#notes

docker exec -ti mailserver setup email add toto@l2-4.ephec-ti.be

telnet mail.l2-4.ephec-ti.be 25
HELO mail.l2-4.ephec-ti.be
MAIL FROM: toto@l2-4.ephec-ti.be 
RCPT TO: titi@l2-4.ephec-ti.be
DATA 
Subject: TEST MESSAGE 1
Date: test X
From: toto@l2-4.ephec-ti.be
Bonjour MR TITI, 
Comment how are u?
.
QUIT


openssl s_client -connect mail.l2-4.ephec-ti.be:993
a login titi@l2-4.ephec-ti.be Loki!
a select inbox
a FETCH 1:* (FLAGS BODY[HEADER.FIELDS (SUBJECT FROM DATE)])

a list "" *
a GETQUOTA "" 
a logout
