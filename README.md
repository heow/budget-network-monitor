# budget-network-monitor

Very simple network monitor to track Internet useage-time for specific users.

* great for tracking your kids Internet time
* can run anywhere on your network, including wifi
* works well on a Raspberry Pi
* only for the technically minded

### RaspberryPi Installation

1. to roots crontab, add:
```
@reboot              /home/pi/budget-network-monitor/bin/start-network-monitor.sh
  0 *  *   *   *     /home/pi/budget-network-monitor/bin/generate-report.sh > /var/www/html/index.txt
```
