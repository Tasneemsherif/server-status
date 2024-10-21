#!/bin/bash

cpu_usage () {
  echo "---------------CPU Usage----------------------------"
  top -bn1 | grep "Cpu(s)" |awk '{print "CPU Usage : " 100-$8 "%"}'
  echo "----------------------------------------------------"
}

memory_usage () {
  echo "---------------Memory Usage-------------------------"
  free -m | awk 'NR==2{printf "Memory Usage: %sMB / %sMB (%.2f%%)\n", $3, $2, $3*100/$2 }'
  echo "----------------------------------------------------"
}

disk_usage () {
  echo "---------------Disk Usage---------------------------"
  df -h --total | grep "total" | awk '{print "Disk Usage: Used: "$3 "B / Total: "$2 "B ("$5" used)"}'
  echo "----------------------------------------------------"
}

top_5_cpu_processes(){
    echo "---------------Top 5 CPU Processes------------------"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%cpu | head -6
    echo "----------------------------------------------------"
}

top_5_memory_processes(){
    echo "---------------Top 5 Memory Processes---------------"
    ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head -6
    echo "----------------------------------------------------"
}

additional_stats(){
    echo "---------------Additional Stats---------------------"
    echo "OS Version: $(uname -a)"
    echo "Kernel Version: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo "Load Average: $(uptime | awk -F'load average:' '{ print $2 }')"
    echo "Logged in users: $(who | wc -l)"
    echo "Failed login attempts: $(grep "Failed" /var/log/auth.log | wc -l)"
    echo "----------------------------------------------------"
}

cpu_usage
memory_usage
disk_usage
top_5_cpu_processes
top_5_memory_processes
additional_stats
