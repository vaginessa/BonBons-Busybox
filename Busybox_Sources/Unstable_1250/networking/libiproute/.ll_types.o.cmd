cmd_networking/libiproute/ll_types.o := x86_64-gcc -Wp,-MD,networking/libiproute/.ll_types.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.25.0)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(ll_types)"  -D"KBUILD_MODNAME=KBUILD_STR(ll_types)" -c -o networking/libiproute/ll_types.o networking/libiproute/ll_types.c

deps_networking/libiproute/ll_types.o := \
  networking/libiproute/ll_types.c \
    $(wildcard include/config/feature/ip/rare/protocols.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/socket.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/features.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/alltypes.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/socket.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/arpa/inet.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/netinet/in.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/inttypes.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdint.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/stdint.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/if_arp.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/netdevice.h \
    $(wildcard include/config/port/unknown.h) \
    $(wildcard include/config/port/10base2.h) \
    $(wildcard include/config/port/10baset.h) \
    $(wildcard include/config/port/aui.h) \
    $(wildcard include/config/port/100baset.h) \
    $(wildcard include/config/port/100basetx.h) \
    $(wildcard include/config/port/100basefx.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/if.h \
    $(wildcard include/config/get/iface.h) \
    $(wildcard include/config/get/proto.h) \
    $(wildcard include/config/iface/v35.h) \
    $(wildcard include/config/iface/v24.h) \
    $(wildcard include/config/iface/x21.h) \
    $(wildcard include/config/iface/t1.h) \
    $(wildcard include/config/iface/e1.h) \
    $(wildcard include/config/iface/sync/serial.h) \
    $(wildcard include/config/iface/x21d.h) \
    $(wildcard include/config/proto/hdlc.h) \
    $(wildcard include/config/proto/ppp.h) \
    $(wildcard include/config/proto/cisco.h) \
    $(wildcard include/config/proto/fr.h) \
    $(wildcard include/config/proto/fr/add/pvc.h) \
    $(wildcard include/config/proto/fr/del/pvc.h) \
    $(wildcard include/config/proto/x25.h) \
    $(wildcard include/config/proto/hdlc/eth.h) \
    $(wildcard include/config/proto/fr/add/eth/pvc.h) \
    $(wildcard include/config/proto/fr/del/eth/pvc.h) \
    $(wildcard include/config/proto/fr/pvc.h) \
    $(wildcard include/config/proto/fr/eth/pvc.h) \
    $(wildcard include/config/proto/raw.h) \
    $(wildcard include/config/oper/unknown.h) \
    $(wildcard include/config/oper/notpresent.h) \
    $(wildcard include/config/oper/down.h) \
    $(wildcard include/config/oper/lowerlayerdown.h) \
    $(wildcard include/config/oper/testing.h) \
    $(wildcard include/config/oper/dormant.h) \
    $(wildcard include/config/oper/up.h) \
    $(wildcard include/config/link/mode/default.h) \
    $(wildcard include/config/link/mode/dormant.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm/types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm-generic/types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm-generic/int-ll64.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm/bitsperlong.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm-generic/bitsperlong.h \
    $(wildcard include/config/64bit.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/posix_types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/stddef.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm/posix_types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm/posix_types_64.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/asm-generic/posix_types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/socket.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/hdlc/ioctl.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/if_ether.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/if_packet.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/if_link.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/linux/netlink.h \
  include/libbb.h \
    $(wildcard include/config/feature/shadowpasswds.h) \
    $(wildcard include/config/use/bb/shadow.h) \
    $(wildcard include/config/selinux.h) \
    $(wildcard include/config/feature/utmp.h) \
    $(wildcard include/config/locale/support.h) \
    $(wildcard include/config/use/bb/pwd/grp.h) \
    $(wildcard include/config/lfs.h) \
    $(wildcard include/config/feature/buffers/go/on/stack.h) \
    $(wildcard include/config/feature/buffers/go/in/bss.h) \
    $(wildcard include/config/feature/verbose.h) \
    $(wildcard include/config/feature/ipv6.h) \
    $(wildcard include/config/feature/seamless/xz.h) \
    $(wildcard include/config/feature/seamless/lzma.h) \
    $(wildcard include/config/feature/seamless/bz2.h) \
    $(wildcard include/config/feature/seamless/gz.h) \
    $(wildcard include/config/feature/seamless/z.h) \
    $(wildcard include/config/feature/check/names.h) \
    $(wildcard include/config/feature/prefer/applets.h) \
    $(wildcard include/config/long/opts.h) \
    $(wildcard include/config/feature/getopt/long.h) \
    $(wildcard include/config/feature/pidfile.h) \
    $(wildcard include/config/feature/syslog.h) \
    $(wildcard include/config/feature/individual.h) \
    $(wildcard include/config/echo.h) \
    $(wildcard include/config/printf.h) \
    $(wildcard include/config/test.h) \
    $(wildcard include/config/kill.h) \
    $(wildcard include/config/chown.h) \
    $(wildcard include/config/ls.h) \
    $(wildcard include/config/xxx.h) \
    $(wildcard include/config/route.h) \
    $(wildcard include/config/feature/hwib.h) \
    $(wildcard include/config/desktop.h) \
    $(wildcard include/config/feature/crond/d.h) \
    $(wildcard include/config/use/bb/crypt.h) \
    $(wildcard include/config/feature/adduser/to/group.h) \
    $(wildcard include/config/feature/del/user/from/group.h) \
    $(wildcard include/config/ioctl/hex2str/error.h) \
    $(wildcard include/config/feature/editing.h) \
    $(wildcard include/config/feature/editing/history.h) \
    $(wildcard include/config/feature/editing/savehistory.h) \
    $(wildcard include/config/feature/tab/completion.h) \
    $(wildcard include/config/feature/username/completion.h) \
    $(wildcard include/config/feature/editing/vi.h) \
    $(wildcard include/config/feature/editing/save/on/exit.h) \
    $(wildcard include/config/pmap.h) \
    $(wildcard include/config/feature/show/threads.h) \
    $(wildcard include/config/feature/ps/additional/columns.h) \
    $(wildcard include/config/feature/topmem.h) \
    $(wildcard include/config/feature/top/smp/process.h) \
    $(wildcard include/config/killall.h) \
    $(wildcard include/config/pgrep.h) \
    $(wildcard include/config/pkill.h) \
    $(wildcard include/config/pidof.h) \
    $(wildcard include/config/sestatus.h) \
    $(wildcard include/config/unicode/support.h) \
    $(wildcard include/config/feature/mtab/support.h) \
    $(wildcard include/config/feature/clean/up.h) \
    $(wildcard include/config/feature/devfs.h) \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/limits.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/limits.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/byteswap.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/endian.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/endian.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdbool.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/unistd.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/posix.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/ctype.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/dirent.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/errno.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/errno.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/fcntl.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/fcntl.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/netdb.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/setjmp.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/setjmp.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/signal.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/signal.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/paths.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdio.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdlib.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/alloca.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdarg.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stddef.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/string.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/strings.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/libgen.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/poll.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/poll.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/ioctl.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/ioctl.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/mman.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/mman.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/stat.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/stat.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/time.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/select.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/types.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/sysmacros.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/wait.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/resource.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/resource.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/termios.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/termios.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/time.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/param.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/pwd.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/grp.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/mntent.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/statfs.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/sys/statvfs.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/statfs.h \
  include/pwd_.h \
  include/grp_.h \
  include/shadow_.h \
  include/xatonum.h \
  networking/libiproute/rt_names.h \

networking/libiproute/ll_types.o: $(deps_networking/libiproute/ll_types.o)

$(deps_networking/libiproute/ll_types.o):
