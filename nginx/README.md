# Zabbix Nginx App

```
Active connections: 1
server accepts handled requests
 142 142 142
Reading: 0 Writing: 1 Waiting: 0
```

active connections – 活跃的连接数量
server accepts handled requests — 总共处理了4个连接 , 成功创建4次握手, 总共处理了4个请求
reading — 读取客户端的连接数.
writing — 响应数据到客户端的数量
waiting — 开启 keep-alive 的情况下,这个值等于 active – (reading+writing), 意思就是 Nginx 已经处理完正在等候下一次请求指令的驻留连接.

Active connections
The current number of active client connections including Waiting connections.
accepts
The total number of accepted client connections.
handled
The total number of handled connections. Generally, the parameter value is the same as accepts unless some resource limits have been reached (for example, the worker_connections limit).
requests
The total number of client requests.
Reading
The current number of connections where nginx is reading the request header.
Writing
The current number of connections where nginx is writing the response back to the client.
Waiting
The current number of idle client connections waiting for a request.
