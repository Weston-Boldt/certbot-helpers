#!/bin/bash

# your email address
email=your_email@emailprovider.com
# your webroot path
# e.g. /var/www/html/
webroot="."
# subdomains you will use for sure every time
default_subdomains=("www")

get_cert() {
    domain=$1
    shift
    subdomains=$@
    subdomains=( "${default_subdomains[@]}" "${subdomains[@]}" )

    # make sure that domain name is str_to_lower'd
    certname=$(awk -v domain="$domain" 'BEGIN {print tolower(domain)}')
    certbot_command="certbot certonly --agree-tos -m $email -w $webroot --cert-name $certname "

    for arg in "${subdomains[@]}";
    do
        certbot_command=$certbot_command"-d $arg.$domain "
    done
    echo $certbot_command;
}

get_cert $@
