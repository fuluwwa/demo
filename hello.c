#include <stdio.h>
#include <stdlib.h>

/*声明sdk_test函数*/
extern int sdk_test(int argc, char *argv[]);

int main(int argc, char **argv)
{
        printf("Hello World!\n\r");
        /*调用SDK Demo中的sdk_test函数，去初始化SDK并连接阿里云物联网平台*/
        sdk_test(0,NULL);
        return(0);
}
