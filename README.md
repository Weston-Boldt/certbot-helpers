# Certbot Helpers
> helper scripts for managing certs via certbot / lets encrypt

## note
my personal preference is to keep cert-names for a domain in a uniform way
i.e. /etc/letsencrypt/archive/test.com

# Script Useage

## Get Cert
> get a cert using certonly flag
> (if you want to let certbot manage your nginx or apache you may need to change the `get_cert` fn to fit your needs)

### config

use your favorite text editor and change the config variables `$email` `$webroot` and `$default_subdomains` to fit your needs

### useage

```sh
$ ./get_cert.sh TOP-LEVEL-DOMAIN [SPACE SEPERATED SUBDOMAINS]
```

### example

```sh
$ ./get_cert.sh example test big.test really.big.test
```
this will leave you a lets encrypt cert that is signed for the domains:
     `example.com` `www.example.com` `test.example.com` `big.test.com` `really.big.test.com`
    ( www is from `default_subdomains`)
>

## dns is on this server
> see if dig +short argv[1] == dig +short $HOSTNAME

### deps:
dig

### useage
```sh
$ dns_is_on_this_server DOMAIN
```
