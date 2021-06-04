# lplantuml
A Auto General Uml Graph Tool Base on plantuml!

# 概述
一个基于plantuml的自动将uml描述文件生成图片的工具！

# 依赖
- lua
- lfs
- java（环境）
- plantuml（https://plantuml.com/zh/）

# 用法
```shell
# lua.exe lua-plantuml.lua uml_dir
```

# 测试uml
```uml
@startuml
e1->b1:zactest request
e1<-b1:zactest response
@enduml
```
# 目标文件
![image](https://github.com/xiyoo0812/lplantuml/blob/master/example/test.png)
