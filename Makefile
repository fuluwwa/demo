PROG_FILE := hello.c mqtt_basic_demo.c
PROG_OBJS := $(patsubst %.c,%.o,$(PROG_FILE))
PROG = hello

SDK_ROOT = $(shell pwd)/LinkSDK
SDK_DIR = $(SDK_ROOT)/core $(SDK_ROOT)/core/sysdep $(SDK_ROOT)/core/utils  $(SDK_ROOT)/portfiles/aiot_port $(SDK_ROOT)/external  $(SDK_ROOT)/external/mbedtls/library
SDK_INC = -I$(SDK_ROOT)/external/mbedtls/include  $(foreach dir, $(SDK_DIR), -I$(dir) )
SDK_FILES = $(foreach dir, $(SDK_DIR), $(wildcard $(dir)/*.c))
SDK_OBJS = $(patsubst %.c,%.o,$(SDK_FILES))
SDK_LIBS = -lpthread

CFLAGS += $(SDK_INC)

main:$(PROG_OBJS) $(SDK_OBJS)
	$(CC) $(CFLAGS) -o $(PROG) $(PROG_OBJS) $(SDK_OBJS) $(SDK_LIBS)

clean:
	rm -f *.o $(PROG) $(SDK_OBJS)
