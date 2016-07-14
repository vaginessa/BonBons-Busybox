cmd_libbb/perror_nomsg.o := x86_64-gcc -Wp,-MD,libbb/.perror_nomsg.o.d   -std=gnu99 -Iinclude -Ilibbb  -include include/autoconf.h -D_GNU_SOURCE -DNDEBUG -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64 -D"BB_VER=KBUILD_STR(1.25.0)" -DBB_BT=AUTOCONF_TIMESTAMP  -Wall -Wshadow -Wwrite-strings -Wundef -Wstrict-prototypes -Wunused -Wunused-parameter -Wunused-function -Wunused-value -Wmissing-prototypes -Wmissing-declarations -Wno-format-security -Wdeclaration-after-statement -Wold-style-definition -fno-builtin-strlen -finline-limit=0 -fomit-frame-pointer -ffunction-sections -fdata-sections -fno-guess-branch-probability -funsigned-char -static-libgcc -falign-functions=1 -falign-jumps=1 -falign-labels=1 -falign-loops=1 -fno-unwind-tables -fno-asynchronous-unwind-tables -fno-builtin-printf -Os     -D"KBUILD_STR(s)=\#s" -D"KBUILD_BASENAME=KBUILD_STR(perror_nomsg)"  -D"KBUILD_MODNAME=KBUILD_STR(perror_nomsg)" -c -o libbb/perror_nomsg.o libbb/perror_nomsg.c

deps_libbb/perror_nomsg.o := \
  libbb/perror_nomsg.c \
  include/platform.h \
    $(wildcard include/config/werror.h) \
    $(wildcard include/config/big/endian.h) \
    $(wildcard include/config/little/endian.h) \
    $(wildcard include/config/nommu.h) \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/limits.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/features.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/limits.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/byteswap.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdint.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/alltypes.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/stdint.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/endian.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/endian.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/stdbool.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/unistd.h \
  /mnt/E25E7E6A5E7E36FF/BonBons-Busybox/cross-compiler-x86_64/include/bits/posix.h \

libbb/perror_nomsg.o: $(deps_libbb/perror_nomsg.o)

$(deps_libbb/perror_nomsg.o):
