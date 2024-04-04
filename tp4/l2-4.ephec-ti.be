$TTL 86400
@       IN      SOA     l2-4.ephec-ti.be. admin.l2-4.ephec-ti.be. (
                        2024030901      ; Serial
                        14400            ; Refresh
                        3600            ; Retry
                        604800          ; Expire
                        86400           ; Minimum TTL
                        )
                TXT     "bonjourrrrrr"

; Name servers
@       IN      NS      ns.l2-4.ephec-ti.be.
; A Records
@       IN      A       54.37.13.151
www     IN      A       54.37.13.151
_acme-challenge.l2-4.ephec-ti.be. TXT "xH5zRNiJtAqwm4D7zgKsDC2RRR8pviAWd-w6Tg51nIA"
gaspard.www  IN      A       54.37.13.151

www2    IN      CNAME   www.l2-4.ephec-ti.be.
www3    IN      CNAME   www.l2-4.ephec-ti.be.
ns      IN      A       54.37.13.151
mail    IN      A       203.0.113.3 



maxime    IN      NS      ns.maxime.l2-4.ephec-ti.be.
ns.maxime IN      A       54.37.13.241

woodytoys    IN      NS      ns.woodytoys.l2-4.ephec-ti.be.
ns.woodytoys IN      A       213.213.232.156

www6    IN      A   54.37.13.198


; MX Record (if you have mail server)

; Subdomains (if any)
subdomain   IN      A       54.37.13.151

