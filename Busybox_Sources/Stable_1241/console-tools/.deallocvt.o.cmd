cmd_console-tools/deallocvt.o := mips-gcc -Wp,-MD,console-tools/.deallocvt.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.24.1BonBon)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(deallocvt)"  -D"KBUILD_MODNAME=KBUILD_STR(deallocvt)" -c -o console-tools/deallocvt.o console-tools/deallocvt.c

deps_console-tools/deallocvt.o := \
  console-tools/deallocvt.c \
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
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/limits.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/features.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/limits.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/byteswap.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stdint.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/alltypes.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/stdint.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/endian.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/endian.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stdbool.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/unistd.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/posix.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/ctype.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/dirent.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/errno.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/errno.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/fcntl.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/fcntl.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/inttypes.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/netdb.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/netinet/in.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/socket.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/socket.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/setjmp.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/setjmp.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/signal.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/signal.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stdio.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stdlib.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/alloca.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stdarg.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/stddef.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/string.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/strings.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/libgen.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/poll.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/poll.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/ioctl.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/ioctl.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/mman.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/mman.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/stat.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/stat.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/time.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/select.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/types.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/sysmacros.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/wait.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/resource.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/resource.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/termios.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/termios.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/time.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/param.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/pwd.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/grp.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/mntent.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/statfs.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/sys/statvfs.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/bits/statfs.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/utmpx.h \
  /media/devbonbon/PROJECTS/BonBons-Busybox/Busybox_Compilers/mips/include/arpa/inet.h \
  include/pwd_.h \
  include/grp_.h \
  include/shadow_.h \
  include/xatonum.h \

console-tools/deallocvt.o: $(deps_console-tools/deallocvt.o)

$(deps_console-tools/deallocvt.o):
