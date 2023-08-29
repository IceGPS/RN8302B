# RN8302B
用LUA读取电能计量芯片RN8302B的三相交流电数据，LUA开发板选用合宙的ESP32S3

# V 0.0.3 原来S3和C3的SPIID是2
现在可以自动适配Air101/103/601/105/S3/C3/EC618等开发板的SPI接口。
如果重复设置SPI接口，返回值是259，Luatools会给出SPI已经初始化的提示。
``` log
[2023-08-29 16:47:02.027] D/vmheap Found 8192 kbyte PSRAM
[2023-08-29 16:47:02.027] I/main LuatOS@ESP32S3 base 22.12 bsp V1004 32bit
[2023-08-29 16:47:02.027] I/main ROM Build: Mar 24 2023 12:13:45
[2023-08-29 16:47:02.039] I/fs script zone as luadb
[2023-08-29 16:47:02.073] D/main loadlibs luavm 4194296 14504 14504
[2023-08-29 16:47:02.073] D/main loadlibs sys   8615472 4288112 4288476
[2023-08-29 16:47:02.119] I/user.Main Task	ESP32S3	RN8302B
[2023-08-29 16:47:02.119] open SPI	0
```

# V 0.0.2 换成Air103的开发板之后就可以正常设置打开SPI接口了
``` log
看来问题是ESP32S3的固件有问题
[2023-08-28 23:54:49.165] D/main poweron: power or reset
[2023-08-28 23:54:49.165] I/main auth ok 8510425030393837351200D2A11456060078 AIR103
[2023-08-28 23:54:49.165] I/main LuatOS@AIR103 base 22.12 bsp V0017 32bit
[2023-08-28 23:54:49.165] I/main ROM Build: Jul 10 2023 14:22:51
[2023-08-28 23:54:49.173] D/main loadlibs luavm 180144 12344 12344
[2023-08-28 23:54:49.173] D/main loadlibs sys   55296 10557 10557
[2023-08-28 23:54:49.176] I/user.Main Task	AIR103	RN8302B
[2023-08-28 23:54:49.176] open SPI	0
```

# V 0.0.1 设置并启用SPI接口失败
``` log
[2023-08-28 23:25:54.884] D/vmheap Found 8192 kbyte PSRAM
[2023-08-28 23:25:54.884] I/main LuatOS@ESP32S3 base 22.12 bsp V1004 32bit
[2023-08-28 23:25:54.884] I/main ROM Build: Mar 24 2023 12:13:45
[2023-08-28 23:25:54.892] I/fs script zone as luadb
[2023-08-28 23:25:54.892] D/main loadlibs luavm 4194296 14504 14504
[2023-08-28 23:25:54.892] D/main loadlibs sys   8615472 4288112 4288476
[2023-08-28 23:25:54.961] I/user.Main Task	RN8302B
[2023-08-28 23:25:54.961] open SPI	-1
[2023-08-28 23:25:54.961] spi open error	-1
```
