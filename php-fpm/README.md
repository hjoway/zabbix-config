curl -s 127.0.0.1/status

pool:                 www
process manager:      dynamic
start time:           09/Aug/2019:06:31:06 +0000
start since:          1010
accepted conn:        32
listen queue:         0
max listen queue:     0
listen queue len:     128
idle processes:       1
active processes:     1
total processes:      2
max active processes: 1
max children reached: 0
slow requests:        0

pool # fpm池名称，大多数为www
process manager # 进程管理方式,值：static, dynamic or ondemand. dynamic
start time # 启动日期,如果reload了php-fpm，时间会更新
start since # 运行时长
accepted conn # 当前池接受的请求数
listen queue # 请求等待队列，如果这个值不为0，那么要增加FPM的进程数量
max listen queue # 请求等待队列最高的数量
listen queue len # socket等待队列长度
idle processes # 空闲进程数量
active processes # 活跃进程数量
total processes # 总进程数量
max active processes # 最大的活跃进程数量（FPM启动开始算）
max children reached # 进程最大数量限制的次数，如果这个数量不为0，那说明你的最大进程数量太小了，请改大一点。
slow requests # 启用了php-fpm slow-log，缓慢请求的数量
