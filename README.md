
# Server Performance Stats Script

## Project Overview

The **`server-stats.sh`** script is a simple utility designed to provide essential server performance statistics. It is intended to be run on any Linux server and offers key metrics that help in understanding the server’s resource utilization and performance.
here is the project url: https://roadmap.sh/projects/server-stats

### Features
- **CPU Usage**: Shows total CPU utilization.
- **Memory Usage**: Displays the total memory used, free memory, and percentage of usage.
- **Disk Usage**: Provides the total disk usage and available space along with the usage percentage.
- **Top Processes by CPU**: Lists the top 5 processes consuming the most CPU resources.
- **Top Processes by Memory**: Lists the top 5 processes consuming the most memory resources.

### Stretch Goals (Optional Features)
- **OS Version**: Prints the operating system version.
- **Uptime**: Displays how long the system has been running.
- **Load Average**: Shows the system's load averages (1 min, 5 min, 15 min).
- **Logged-In Users**: Lists users currently logged in.
- **Failed Login Attempts**: Optionally shows failed login attempts for security monitoring.

## Requirements
- A Linux server or system to run the script.
- Basic shell environment (bash).

## Usage

1. **Clone or Copy the Script**:
   Save the script file as `server-stats.sh`.

2. **Make the Script Executable**:
   Ensure the script has execution permissions:
   ```bash
   chmod +x server-stats.sh
   ```

3. **Run the Script**:
   Execute the script to display server performance stats:
   ```bash
   ./server-stats.sh
   ```

4. **Sample Output**:
   Here’s an example of what the output might look like:
   ```
   Total CPU Usage: 20%
   Total Memory Usage: Used: 3.5G, Free: 500M, Usage: 85%
   Total Disk Usage: Used: 40G, Free: 60G, Usage: 40%
   Top 5 Processes by CPU Usage:
       PID  USER   %CPU  COMMAND
       1234 root   30.5  process1
       1235 root   25.1  process2
       ...
   Top 5 Processes by Memory Usage:
       PID  USER   %MEM  COMMAND
       5678 user1  40.2  process3
       5679 user2  35.5  process4
       ...
   ```

## Script Breakdown

- **CPU Usage**: Uses the `mpstat` or `top` command to calculate CPU utilization.
- **Memory Usage**: Gathers total, used, and free memory statistics from `/proc/meminfo` or the `free` command.
- **Disk Usage**: Uses the `df` command to get disk space details.
- **Top Processes by CPU/Memory**: Uses `ps` command with sorting on `%CPU` and `%MEM` fields.

## Customization

- You can add more stats by extending the script to display information such as:
  - **OS version** using `cat /etc/os-release`
  - **Uptime** using `uptime`
  - **Logged-in users** using `who`
  - **Failed login attempts** by parsing the `/var/log/auth.log` file or using `lastb`.

## License

This project is free to use and distribute under the [MIT License](LICENSE).
