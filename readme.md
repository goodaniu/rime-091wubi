[Rime](https://rime.im/) 输入法是一个输入配置方案，不是输入法本身。

配置文件参考了： [KyleBing](https://github.com/KyleBing/wubi-jidan-dict)。

后来进行了一些个性化修改。

**将文件复制到Rime工作目录中，部署后即可使用。**

# 091五笔，点儿词库

在**王永民**发明的86五笔基础上，**行走的风景**改良了字根及词库，称为**091五笔**。

后来由**晓览**（[晓览的网盘](http://gaokuan.ysepan.com/)）接手，又增添、删改了大量的字根和词条，最终命名为**点儿词库**，按年或季度更新。我询问过他是否可以放在GitHub上，他说可以**随意传播**这个词库。

## 1. dianer

**dianer方案**中的词条来自晓览的原版点儿词库（2025春版），主要是改成Rime格式，增加权重，未删改任何词条，共有21.9万多词条。

词条在`dianer.dict.yaml`文件中。

生僻字在`aniu_spz.dict.yaml`中，已在dianer.dict.yaml中挂载，默认过滤生僻字，可按快捷键`Ctrl+0`选择相应的选项启用。

## 2. aniu
**aniu方案**是基于点儿词库2024秋版，然后结合我自身的使用习惯，进行了一些个性化删改。

### aniu.dict.yaml
我并未把词条放在这个文件中，只是平时要新增词条时，会临时写入这个文件，数量多时便转移到`aniu_main.dict.yaml`文件中。

### aniu_main.dict.yaml
主要词条放在这个文件中，共有21.8万多的词条，涵盖了各种日常使用频率高的词组，具体可以到[晓览的网盘](http://gaokuan.ysepan.com/)下载教程。

### aniu_spz.dict.yaml
除了`aniu_main.yaml`中的27345个生僻字（权重为5）以外，其它生僻字（66119个）都在`aniu_spz.dict.yaml`这个文件中，几乎包含了所有的生僻字。

配置中默认过滤僻字，按快捷键`Ctrl+0`可选择相应的选项启用。

### aniu_pri.dict.yaml
记录个人不方便公开的词条。

### aniu_user.dict.yaml
本来是用来记录用户词条，不过我没有用它，如果需要可以在**aniu.dict.yaml**中取消注释。

### symbols.yaml
标点符号映射和各种特殊的符号（以`/`开头，具体请查看文件）。

# 86五笔
`wubi86_jidian`方案。

我已转向091五笔方案，不过还是留着这个方案，如有需要，可到`default.custom.yaml`中启用，取消注释，重新部署即可。

![rime_all](https://github.com/KyleBing/rime-wubi86-jidian/assets/12215982/710c7e80-1660-48f1-bcc5-157c6bd3f662)

**说明**：
1. 结合了[晓览](http://gaokuan.ysepan.com/)分享的极爽6.0二简二重词库、[极光五笔词库](https://gitee.com/jack2583/wubi-tables.git)中的GB18030-2000编码，共有7万余单字，17万多词组。
2. 做了些许微调，在`co`和`mv`键位上安排了不少的标点符号，修改了一些单字的编码，放置到二级或三级简码。
3. 词库总共有7万多单字，其中按字符集分成了不同的权重，大于8的有将近7000个字，8以上的是8105个通用规范用字，5以上是归属GB18030-2000字符集（2.7万余字）,3以上是归属于GB18030-2005字符集。

 # 简体拼音
 `pinyin_simp`方案，词库文件主要来自**白霜拼音**（[rime-frost](https://github.com/gaboolic/rime-frost)）

 # 英文
 `melt_eng`方案，一个简单的英文输入方案，词条数并不多，也是来自**白霜拼音**（[rime-frost](https://github.com/gaboolic/rime-frost)）。

 # 皮肤
 `aniu.trime.yaml`是适用于安卓端同文输入法的皮肤文件，我结合默认的同文风皮肤和[mytrime](https://github.com/chwt163/mytrime)的色彩风格修改而来，适用于`3.3.3`的版本。

 至于`squirrel.custom.yaml`和`weasel.custom.yaml`，它们是其它平台的皮肤文件，我没有用过，不知是否还能用，不需要可以删除。

 # ri脚本
 这是一个**临时**增删改词条的Linux Shell脚本，依赖fzf和nvim程序，使用前可能需要**修改**一下脚本中的几个**dict文件名**和**第11行**的路径。

 **如果大量修改，不要使用这个脚本。**

 **修改后要重新部署才能生效。**

 不需要的可以删除。

 ## 使用说明
 这是处理rime输入法码表的脚本。

- `ri code`        查询形如`code`的编码，支持以`.`替代字母，如`ri ad.` , `ri ad.\?`
- `ri code,`       查询以`code`开头的单字编码
- `ri 词条`        查询`词条`的编码，支持以`.`代替汉字
- `ri -d code`                  删除词条
- `ri -c code`                  修改编码或权重，在修改环节，如果修改权重只需要数字，修改编码则需要提供`词条 编码 权重`，以空格区分即可。
- `ri -a code`                  在所选词条后添加新的词条，在新增环节，输入`词条 编码 权重`，以空格区分即可。
- `ri -p 词条 code 权重`         在`pri`词库末尾追加新的编码
- `ri -v <aniu>`    使用打开`aniu`文件


上述code指的是词条的编码。

修改、删除、添加时**不要多选**。

 # 其它
 至于其它方案`numbers` （大写数字） 、 `wubi86_jidian_pinyin`（86五笔拼音） 、 `wubi86_jidian_trad`（简入繁出86五笔） 、 `wubi86_jidian_trad_pinyin`（简入繁出86五笔拼音） ，方案来自 [KyleBing](https://github.com/KyleBing/wubi-jidan-dict)。我没有使用，也没有测试过，只是放在那里，如果觉得不需要，可以删除。

 `dev.suyu_emu.suyu.svg`和`wubi86_jidian.ico`是两个图标文件，`imgs`文件夹中是fcitx5候选栏上的图标，比默认的颜色加深了些。删除它们并不影响什么。

 # 推荐
五笔学习推荐B站[晓览YMPA](https://space.bilibili.com/108585624)的视频。

官方教程：[rime输入法用户指导](https://github.com/rime/home/wiki/UserGuide)
