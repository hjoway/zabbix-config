#!/usr/bin/env bash
# Monitor Redis status by Zabbix
#

REDISPATH='/usr/bin/redis-cli'
HOST='127.0.0.1'
PORT='6379'
PASSWORD='buzhidao'
REDIS_INFO="$REDISPATH -h $HOST -p $PORT -a $PASSWORD INFO"

case $1 in
    # Server

    redis_version)
        $REDIS_INFO | grep 'redis_version:' | awk -F ':' '{print $NF}'
        ;;
    # redis_git_sha1:00000000
    # redis_git_dirty:0
    # redis_build_id:9435c3c2879311f3
    # redis_mode:standalone
    # os:Linux 4.15.0-55-generic x86_64
    # arch_bits:64
    # multiplexing_api:epoll
    # atomicvar_api:atomic-builtin
    # gcc_version:7.4.0
    # process_id:799
    # run_id:2a7ae2f7dab9178832f599c443843f848ac924e0
    # tcp_port:6379
    # uptime_in_seconds:71
    uptime_in_days)
        $REDIS_INFO | grep 'uptime_in_days:' | awk -F ':' '{print $NF}'
        ;;
    # hz:10
    # lru_clock:4861603
    # executable:/usr/bin/redis-server
    # config_file:/etc/redis/redis.conf

    # Clients

    connected_clients)
        $REDIS_INFO | grep 'connected_clients:' | awk -F ':' '{print $NF}'
        ;;
    client_longest_output_list)
        $REDIS_INFO | grep 'client_longest_output_list:' | awk -F ':' '{print $NF}'
        ;;
    client_biggest_input_buf)
        $REDIS_INFO | grep 'client_biggest_input_buf:' | awk -F ':' '{print $NF}'
        ;;
    blocked_clients)
        $REDIS_INFO | grep 'blocked_clients:' | awk -F ':' '{print $NF}'
        ;;

    # Memory
    used_memory)
        $REDIS_INFO | grep 'used_memory:' | awk -F ':' '{print $NF}'
        ;;
    # used_memory_human:822.19K
    used_memory_rss)
        $REDIS_INFO | grep 'used_memory_rss:' | awk -F ':' '{print $NF}'
        ;;
    # used_memory_rss_human:3.53M
    used_memory_peak)
        $REDIS_INFO | grep 'used_memory_peak:' | awk -F ':' '{print $NF}'
        ;;
    # used_memory_peak_human:822.19K
    used_memory_peak_perc)
        $REDIS_INFO | grep 'used_memory_peak_perc:' | awk -F ':' '{printf("%.2f\n", $NF)}'
        ;;
    used_memory_overhead)
        $REDIS_INFO | grep 'used_memory_overhead:' | awk -F ':' '{print $NF}'
        ;;
    used_memory_startup)
        $REDIS_INFO | grep 'used_memory_startup:' | awk -F ':' '{print $NF}'
        ;;
    used_memory_dataset)
        $REDIS_INFO | grep 'used_memory_dataset:' | awk -F ':' '{print $NF}'
        ;;
    used_memory_dataset_perc)
        $REDIS_INFO | grep 'used_memory_dataset_perc:' | awk -F ':' '{printf("%.2f\n", $NF)}'
        ;;
    total_system_memory)
        $REDIS_INFO | grep 'total_system_memory:' | awk -F ':' '{print $NF}'
        ;;
    # total_system_memory_human:3.85G
    used_memory_lua)
        $REDIS_INFO | grep 'used_memory_lua:' | awk -F ':' '{print $NF}'
        ;;
    # used_memory_lua_human:37.00K
    maxmemory)
        $REDIS_INFO | grep 'maxmemory:' | awk -F ':' '{print $NF}'
        ;;
    # maxmemory_human:0B
    # maxmemory_policy:noeviction
    # mem_fragmentation_ratio:4.40
    # mem_allocator:jemalloc-3.6.0
    # active_defrag_running:0
    # lazyfree_pending_objects:0

    # Persistence

    # loading:0
    # rdb_changes_since_last_save:0
    # rdb_bgsave_in_progress:0
    # rdb_last_save_time:1565142620
    # rdb_last_bgsave_status:ok
    # rdb_last_bgsave_time_sec:-1
    # rdb_current_bgsave_time_sec:-1
    # rdb_last_cow_size:0
    # aof_enabled:0
    # aof_rewrite_in_progress:0
    # aof_rewrite_scheduled:0
    # aof_last_rewrite_time_sec:-1
    # aof_current_rewrite_time_sec:-1
    # aof_last_bgrewrite_status:ok
    # aof_last_write_status:ok
    # aof_last_cow_size:0

    # Stats
    total_connections_received)
        $REDIS_INFO | grep 'total_connections_received:' | awk -F ':' '{print $NF}'
        ;;
    total_commands_processed)
        $REDIS_INFO | grep 'total_commands_processed:' | awk -F ':' '{print $NF}'
        ;;
    instantaneous_ops_per_sec)
        $REDIS_INFO | grep 'instantaneous_ops_per_sec:' | awk -F ':' '{print $NF}'
        ;;
    total_net_input_bytes)
        $REDIS_INFO | grep 'total_net_input_bytes:' | awk -F ':' '{print $NF}'
        ;;
    total_net_output_bytes)
        $REDIS_INFO | grep 'total_net_output_bytes:' | awk -F ':' '{print $NF}'
        ;;
    # instantaneous_input_kbps:0.00
    # instantaneous_output_kbps:0.00
    rejected_connections)
        $REDIS_INFO | grep 'rejected_connections:' | awk -F ':' '{print $NF}'
        ;;
    sync_full)
        $REDIS_INFO | grep 'sync_full:' | awk -F ':' '{print $NF}'
        ;;
    # sync_partial_ok:0
    # sync_partial_err:0
    expired_keys)
        $REDIS_INFO | grep 'expired_keys:' | awk -F ':' '{print $NF}'
        ;;
    # expired_stale_perc:0.00
    expired_time_cap_reached_count)
        $REDIS_INFO | grep 'expired_time_cap_reached_count:' | awk -F ':' '{print $NF}'
        ;;
    evicted_keys)
        $REDIS_INFO | grep 'evicted_keys:' | awk -F ':' '{print $NF}'
        ;;
    keyspace_hits)
        $REDIS_INFO | grep 'keyspace_hits:' | awk -F ':' '{print $NF}'
        ;;
    keyspace_misses)
        $REDIS_INFO | grep 'keyspace_misses:' | awk -F ':' '{print $NF}'
        ;;
    pubsub_channels)
        $REDIS_INFO | grep 'pubsub_channels:' | awk -F ':' '{print $NF}'
        ;;
    # pubsub_patterns:0
    # latest_fork_usec:0
    # migrate_cached_sockets:0
    # slave_expires_tracked_keys:0
    # active_defrag_hits:0
    # active_defrag_misses:0
    # active_defrag_key_hits:0
    # active_defrag_key_misses:0

    # Replication

    # role:master
    connected_slaves)
        $REDIS_INFO | grep 'connected_slaves:' | awk -F ':' '{print $NF}'
        ;;
    # master_replid:9cf791869c501ef80244b3a6f2d3c3216c526685
    # master_replid2:0000000000000000000000000000000000000000
    # master_repl_offset:0
    # second_repl_offset:-1
    # repl_backlog_active:0
    # repl_backlog_size:1048576
    # repl_backlog_first_byte_offset:0
    # repl_backlog_histlen:0

    # CPU
    used_cpu_sys)
        $REDIS_INFO | grep 'used_cpu_sys:' | awk -F ':' '{print $NF}'
        ;;
    used_cpu_user)
        $REDIS_INFO | grep 'used_cpu_user:' | awk -F ':' '{print $NF}'
        ;;
    used_cpu_sys_children)
        $REDIS_INFO | grep 'used_cpu_sys_children:' | awk -F ':' '{print $NF}'
        ;;
    used_cpu_user_children)
        $REDIS_INFO | grep 'used_cpu_user_children:' | awk -F ':' '{print $NF}'
        ;;

    # Cluster
    cluster_enabled)
        $REDIS_INFO | grep 'cluster_enabled:' | awk -F':' '{print $NF}'
        ;;

    # Keyspace
    # db1:keys=2,expires=0,avg_ttl=0

    *)
        echo -e "\e[031mUsage: $0 {uconnected_clients|used_cpu_user_children|cluster_enabled}\e[0m"
        exit 1
esac
