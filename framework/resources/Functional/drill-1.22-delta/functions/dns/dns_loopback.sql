-- expected: loopback resolution via /etc/hosts; host name is host-dependent so regex
select get_host_address('localhost') a, get_host_name('127.0.0.1') b, host_lookup('localhost') c from (values(1))
