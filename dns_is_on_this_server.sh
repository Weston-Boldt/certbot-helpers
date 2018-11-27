dns_is_on_this_server()
{
    client_ip=$(dig +short $1)
    host_ip=$(dig +short $HOSTNAME)
    if ! [ $client_ip != $host_ip ];
    then
        return 1
    fi
    return 0
}
