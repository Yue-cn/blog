---
title : 关于 OpenFRPC 的 HTTPS功能概述
date : 2023-5-1
tag : 科技
---

<p>
OpenFrpc基于原版FRPC修改，也添加了许多功能。这篇文章将高梳理其更新的内容。
</p>

<!-- more -->


<div>
    <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js?client=ca-pub-8096944830734337"
        crossorigin="anonymous"></script>
    <ins class="adsbygoogle"
        style="display:block; text-align:center;"
        data-ad-layout="in-article"
        data-ad-format="fluid"
        data-ad-client="ca-pub-8096944830734337"
        data-ad-slot="8837670046"></ins>
    <script>
        (adsbygoogle = window.adsbygoogle || []).push({});
    </script>
</div>

<div>

#### TCP隧道

>```ini
>auto_tls = false # 是否启用自动TLS
>	# false [默认] 不启用自动https
>	# true  启动自动https (证书不受信 且 CommonName 不含任何域名)
>	# 其他值(Others):
>	# frpc 将尝试加载当前工作目录(cwd)下 <auto_https>.crt 和 <auto_https>.key 两个证书文件
>	# 若文件不存在或解析失败 生成自签名证书不含任何域名
>	# 可启用Debug `log_level = debug` 来获得工作目录(cwd)
>auto_tls_mode = auto #工作模式
>	# auto [默认] 模式: 隧道会探测本地服务是否为http/s
>	# http 		    模式: 将请求反代发送给本地 http 服务
>	# https		    模式: 将请求反代发送给本地 https 服务
>	# passthrough 模式: 直通模式 单纯为本地 tcp 服务套用 TLS
>```
>

<br/>

#### HTTPS隧道

>```ini
>auto_tls = false	# 同上
>auto_tls_mode = auto	# 同上
>force_https = true
>
> 默认为 `false` 当设置为 `true` 时
> 访问 http://example.com 会自动跳转到 https://example.com
> 状态码为 `301 Moved Permanently` 返回的 Location 头包含 Host、Path 和 Query
> #### 注意
> 当隧道设置 `force_https = true` 此隧道包含的所有域名对应的 `http` 隧道无效
> 即:
> 访问 http://example.com `一定会` 自动跳转到 https://example.com
> `一定不会` 去尝试访问对应的 `http` 隧道
>```
</div>


