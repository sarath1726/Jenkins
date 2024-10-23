./qemu-system-arm -m 512 -M ast2600-evb -nographic \
    -drive file=./obmc-phosphor-image-evb-ast2600-20240906065230.static.mtd,format=raw,if=mtd \
    -net nic \
    -net user,hostfwd=:127.0.0.1:2222-10.0.2.15:22,hostfwd=:127.0.0.1:2443-10.0.2.15:443,hostfwd=udp:127.0.0.1:2623-10.0.2.15:623,hostname=q
