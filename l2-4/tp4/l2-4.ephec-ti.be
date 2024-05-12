$TTL 86400
@       IN      SOA     l2-4.ephec-ti.be. admin.l2-4.ephec-ti.be. (
                        2024030901      ; Serial
                        14400            ; Refresh
                        3600            ; Retry
                        604800          ; Expire
                        86400           ; Minimum TTL
                        )
        IN      MX      10 mail.l2-4.ephec-ti.be.

@       IN      NS      ns.l2-4.ephec-ti.be.


l2-4.ephec-ti.be. IN TXT "v=spf1 mx -all"

mail._domainkey IN      TXT     ( "v=DKIM1; h=sha256; k=rsa; "
          "p=MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA6W2aAFvC6So+hm9/9TTyscA0UH4px4+wZg/jXdTVeSLwLl/9GSXuFEA5kHwG+1JTVrWM45yD3NIQYgwuB21uq+iXTBQqTW4EHtn/thcD5bUxi09PuPCUSTfiiiTPmUQ5szOYsRBNVgCbfmejtz/o+1YNxTsfBXMait9pU3u1F02hoE3AzkAYUrEKUo7bPrBQJLWhAjOpcs3DjC"
          "XetY044XAnH3U604RciPf6x2NUQ7F39DIpRE3gY+7wLC/LZkqJZ6xVVKvoqscASY7xb68i6rQoUYkqzZ1gbY2krE/iu7NeNRZAAtQBQSOLBDE52E9qoOwqymLWiCK/K/fr+CVC+QIDAQAB" )  ; ----- DKIM key mail for l2-4.ephec-ti.be


; Name servers

; A Records
@       IN      A       54.37.13.151
www     IN      A       54.37.13.151
_acme-challenge.l2-4.ephec-ti.be. TXT "xH5zRNiJtAqwm4D7zgKsDC2RRR8pviAWd-w6Tg51nIA"
gaspard.www  IN      A       54.37.13.151

www2    IN      CNAME   www.l2-4.ephec-ti.be.
www3    IN      CNAME   www.l2-4.ephec-ti.be.
blog    IN      CNAME   www.l2-4.ephec-ti.be.
ns      IN      A       54.37.13.151
mail    IN      A       54.37.13.151
woody   IN      A       54.37.13.151
cdn.woody IN CNAME cl-glf876fc7c.gcdn.co.
;cdn.woody IN    CNAME   woody

maxime    IN      NS      ns.maxime.l2-4.ephec-ti.be.
ns.maxime IN      A       54.37.13.241

woodytoys    IN      NS      ns.woodytoys.l2-4.ephec-ti.be.
ns.woodytoys IN      A       213.213.232.156

www6    IN      A   54.37.13.198


; Subdomains (if any)
subdomain   IN      A       54.37.13.151

; DMARC Record
_dmarc  IN  TXT "v=DMARC1; p=quarantine; rua=mailto:gaspard.derruine@gmail.com; ruf=mailto:gaspard.derruine@gmail.com; fo=1"
