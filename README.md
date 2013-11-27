`EN README`

- This repo hold the miui recovery source code.
- modify by Gaojiquan LaoYang.
- port recovery binary to c++.
- now can build on cm-11.0  source code.


-------------------------------------------------------------

#support functions

`ORS(Open Recovery Script)` [http://teamw.in/OpenRecoveryScript](http://teamw.in/OpenRecoveryScript)

`full touch support`

`set brightness`

`root devices`

`disable restore the official Recovery`

`dup && tar backup method`

`support tar.gz backup method`

`adb sideload` thanks [@PeterCxy](https://github.com/PeterCxy)

`libiniparser' make it support ini files 

----------------------------------------------------------------




if you need to show the device info from the `recovery menu`
you should add the line to `Boardconfig.mk`

```bash
MIUI_DEVICE_CONF := ../../../device/PRODUCT_NAME/DEVICE_NAME/device.conf
MIUI_INIT_CONF := ../../../device/PRODUCT_NAME/DEVICE_NAME/init.conf
```

you should add the below line to `init.rc`

```bash
export LD_LIBRARY_PATH .:/sbin/
```

`zh-CN README`

这里是托管 MIUI RECOVERY源代码的地方

由[搞机圈论坛](http://www.gaojiquan.com) 老杨进行修改

源代码已经从C语言修改成C++

修改为动态库编译，所以需要在init.rc文件中添加下面的定义

`export LD_LIBRARY_PATH .:/sbin`

如何让MIUI_RECOVERY显示自己设定的信息：
修改方法请参考

[how to support you device](/devices/README.md)

---------------------------------------------------------------------

#settings.ini

```
#MIUI RECOVERY V4.0.0
#modified by Gaojiquan LaoYang
[ziplflash]
md5sum=1;

[dev]
#ifdef ENABLE_LOKI
loki_support=1
#endif
signaturecheck=0
```




---------------------------------------------------------------------

#Releases:

tag `v3.5.0` && `v3.2.0` only can build on cm-10.1 source code tree 


<a href="https://github.com/sndnvaps/miui_recovery/archive/v3.2.0.tar.gz"> v3.2.0.tar.gz </a>

[V3.5.0](https://github.com/sndnvaps/miui_recovery/releases/tag/v3.5.0)


<a href="https://codeload.github.com/sndnvaps/miui_recovery/zip/v3.5.0"> v3.5.0.zip </a>

<a href="https://codeload.github.com/sndnvaps/miui_recovery/tar.gz/v3.5.0"> v3.5.0.tar.gz </a>

----------------------------------------------------------------------


