openssl notes:
- `podman run -it --network host -v /opt/parasoft/:/opt/parasoft/ docker.io/library/gcc:8.5.0 bash`
- `git clone https://github.com/openssl/openssl.git`
- `git checkout -b v3.0.6 tags/openssl-3.0.6`
- `./Configure no-tests -debug`
- `sed -i 's/^CFLAGS=.*/CFLAGS=-Wall -Og -g3 -fno-inline-functions -fdump-rtl-expand/' Makefile`
- `mypatch_extract.sh`
- `make CC=/path/to/bin/insure` 

Get SSL certs:
- `git clone https://github.com/DataDog/security-labs-pocs.git`

test1 simple:
- `cd security-labs-pocs/proof-of-concept-exploits/openssl-punycode-vulnerability/vagrant/WindowsCrash`
- `apps/openssl verify -CAfile ca.crt test.crt 2>&1 | tee /tmp/trace.log`

test2 client/server:
- `openssl s_server -accept 3000 -CAfile ca.crt -cert test.crt -key test.key.pem -state`
- `apps/openssl s_client -connect 192.168.50.237:3000 2>&1 | tee /tmp/trace.log`
