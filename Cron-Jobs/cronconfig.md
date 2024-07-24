# Cron Jobs Configuration

### Overview

This guide provides the configuration details of two essential cron jobs. The first job removes all dangling Docker images, and the second checks the overall CPU utilization, sending an email alert if the usage exceeds a specified percentage.

### Cron Job Details

1. **Removing All Docker Dangling Images**

   - **Command**: `/home/prabir/bash/docker-dangaling.sh`
   - **Schedule**: Every hour
   - **Description**: This cron job executes a script that removes all dangling Docker images, helping to free up disk space and keep the Docker environment clean.

   ```sh
   0 * * * * /home/prabir/bash/docker-dangaling.sh
   ```

2. **Checking Overall CPU Utilization**

   - **Command**: `/home/prabir/bash/check_utilization.sh`
   - **Schedule**: Every 5 minutes
   - **Description**: This cron job runs a script to check the overall CPU utilization. If the usage goes above a specified percentage, an email alert is sent to notify the user.

   ```sh
   */5 * * * * /home/prabir/bash/check_utilization.sh
   ```

### Setting Up Cron Jobs

To set up these cron jobs, follow these steps:

1. Open the cron table for editing by running the command:

   ```sh
   crontab -e
   ```

2. Add the following lines to the cron table:

   ```sh
   0 * * * * /home/prabir/bash/docker-dangaling.sh
   */5 * * * * /home/prabir/bash/check_utilization.sh
   ```

3. Save and exit the editor. The cron jobs are now scheduled and will run at the specified intervals.

### Script Descriptions

- **docker-dangaling.sh**: This script removes all dangling Docker images to maintain a clean Docker environment.
- **check_utilization.sh**: This script monitors CPU utilization. If the usage exceeds a defined threshold, it sends an email alert to the user.

By configuring these cron jobs, you ensure regular maintenance and monitoring of your system, helping to optimize performance and manage resources effectively.
