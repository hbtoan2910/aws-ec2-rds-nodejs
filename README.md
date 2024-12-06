# aws-ec2-rds-nodejs
A demo project showing how to host a simple Node.js application on EC2 and interact with an Amazon RDS database.

## Diagram

![image](https://github.com/user-attachments/assets/409bb36e-dd55-4ac0-9df4-f71bcfba94d3)


## Instruction:

1. We have a simple NodeJS application running on port 3000 with several APIs (total 4 APIs with GET & 1 API with POST)


2. Go to EC2 > Create instance. Remember to add key/pair in order to connect to our instance later. (we have .pem or .ppk file at this step)
  
   Once instance is ready, up and running, we have a Public IPv4 address.

   Note that, once instance is created, it auto creates a VPC (Virtual Private Cloud) & a Subnet
   
   ![image](https://github.com/user-attachments/assets/b0d19f60-6156-4ceb-8beb-401364a57e77)


3. We need to connect to our instance. Choose instance > Connect. If we chose Windows OS, we're gonna use RDP Client to connect to our instance

   ![image](https://github.com/user-attachments/assets/4afffea1-6e5c-40a0-b4f8-49ce4bf34d0e)

   Use this .rdp file to connect. You will be asked for password. Click on Get password > Browse .pem file > Decrypt to see password and save it to use while connecting.
   
   ![image](https://github.com/user-attachments/assets/5d8c5952-fc89-46af-9861-8a24ada02069)

   ![image](https://github.com/user-attachments/assets/6a9ee162-1383-4b3d-9e9e-58932d7dac58)

  If everything is correct, you can log into this instance like this:

  ![image](https://github.com/user-attachments/assets/8a14b115-6c36-4c70-8015-1f6e41d25397)

  You will then need to install Node for Windows, GIT, VS code. Then clone the NodeJS app or you can write your app if you like.

  Run app using: npm server.js


4. Go to Amazon RDS > Create database > in this case I choose Engine MySql community

   ![image](https://github.com/user-attachments/assets/a8123256-e41e-4377-9525-0c5e1928c536)

   Then connect this database with our already-created instance. That's it :)

   ![image](https://github.com/user-attachments/assets/0ba4a1cd-7ed6-4e86-8669-5227aead452b)

  Note that, once we run .sql file to create database (lots), table (characters) & popular data in databse ( 2 columns name, details). 
  
  If you want to see data, install SQL Workbench, connect to this Amazon RDS (Host: Endpoint (ryan-db-01.cf6mmisaixrm.us-east-1.rds.amazonaws.com, port: 3306 ], then run query to see data (use lotr; SELECT * FROM characters;)

  ![image](https://github.com/user-attachments/assets/4d1b47d8-4163-4504-9ab5-2c5a45dbaeab)

  
5. If trying to access using Public IPv4 address you will see it failed. Need to do 2 more steps:

   a / Go to tab Security > Security Groups > Choose > Edit inbound rule > Create rule for port 3000 to allow all connections

   ![image](https://github.com/user-attachments/assets/8bf3493d-8da3-4721-87ea-a8512cac26d6)

   ![image](https://github.com/user-attachments/assets/7aebfa23-6171-42e6-aebf-41a046cc6447)

  b/ By default, Windows blocks most inbound connections, including file sharing and remote desktop, unless explicitly allowed

  Inbound connections refer to network traffic that is initiated from external devices or systems and is directed toward your computer or network. In simpler terms, it's when another device tries to connect to your computer (in this case, your windows instance)

  Solution 1: (bad)

  Go to Windows security > Public network > Turn off Firewall

  ![image](https://github.com/user-attachments/assets/5df3b3e5-7d22-4a69-a5f2-37ec2437619a)

  Solution 2: (good)

   Go to Windows security > Advanced Settings > Create new Inbound Rule > In this case, create Allow port 3000 rule like below:

   ![image](https://github.com/user-attachments/assets/893eddb1-90b4-44b8-8bc3-a4ea37af85b5)


6. Testing result with POSTMAN:

![image](https://github.com/user-attachments/assets/30337e52-f612-4801-a28b-8cc3cbb340aa)

![image](https://github.com/user-attachments/assets/a7cde774-5513-4566-98d5-36cc31222703)

![image](https://github.com/user-attachments/assets/51b05ad2-6309-4db1-bb40-78cfb3f7bf6a)

![image](https://github.com/user-attachments/assets/634e5c0a-a462-46d8-af35-ebd3557e46be)

![image](https://github.com/user-attachments/assets/680c452c-4880-45a8-893c-ad9ee06ce429)

![image](https://github.com/user-attachments/assets/b6d6df54-1023-49bb-b06e-5f85f258ed24)

![image](https://github.com/user-attachments/assets/d979e15d-4bd5-410c-bbb3-9e4e27c540fc)

![image](https://github.com/user-attachments/assets/aef79fd3-abc4-4472-9dc6-6845a60b3b70)

We can also write another NodeJS app and use AXIOS to send HTTP requests to our Public IPv4 address to check for the result if you want 😎😗

![image](https://github.com/user-attachments/assets/a8559094-f5a2-4281-a889-4b5892e65f02)

### Note: 

1/ We can both send HTTP requests to Public IPv4 Address or Public IPv4 DNS to have same result ^^

   Public IPv4 address: 3.95.64.6

   Public IPv4 DNS: ec2-3-95-64-6.compute-1.amazonaws.com

2/ Instead of start our NodeJS app manually and have to restart once having errors/exceptions, we can use library pm2: install globally then run it

   Before: node server.js

   After: pm2 start server.js --name "aws-ec2-rds-nodejs-app"

   ![image](https://github.com/user-attachments/assets/c6aa1315-1c2c-407d-b5b3-458be31e7214)

   PM2 captures application logs: pm2 logs "aws-ec2-rds-nodejs-app" / pm2 logs --lines 100

🔴🔴🔴 We require a solution that can automatically initiate our application after an EC2 instance is rebooted, either planned or unplanned. This will streamline our operations and reduce manual effort.

   Follow below steps: 
   
   npm install -g pm2, it creates a default PM2 home folder (under C:\Users\<username>'\.pm2) that will store PM2 relevant files, like logs (yes, the same you see running pm2 logs), process pid or the dump that is created when you run pm2 save. 
   
   I recommend to run your PM2 commands and check how files change in that folder.

   Now, we will move that folder to a brand new folder: c:\etc\.pm2
  
   Follow these steps:
   
   1. Create a new folder c:\etc\.pm2
   
   2. Create a new PM2_HOME variable (at System level, not User level) and set the value c:\etc\.pm2
   
   3. Close all your open terminal windows (or restart Windows)
   
   4. Ensure that your PM2_HOME has been set properly, running echo %PM2_HOME%
 
    pm2 start server.js --name "aws-ec2-rds-nodejs-app"
    
    pm2 save -> We need to save the configuration to use later on. Once instance is rebooted,  "pm2 resurrect" will be called (thank to pre-created PM2 service at below step) to start our application based on this saved configuration 😈

    Now we are ready to go though different solutions:
    
    a. Using NSSM
    
    b. Using pm2-windows-service
    
    Both implements shares the same idea: create a Windows Service that, when Windows starts, will take care of starts PM2 (pm2 resurrect) and load a specific PM2 configuration (the one that we saved with pm2 save).

    I chose pm2-windows-service to implement:

    So:
    
    0. Before start, did you already setup PM2_HOME and run pm2 save? No?!? It’s definitely time to do that.
    
    1. Install Node module
    
    npm install -g pm2-windows-service
    
    2. As administrator, open command line, run:
    
    pm2-service-install -n PM2
    
    and set the following:
    
    ? Perform environment setup (recommended)? Yes
    
    ? Set PM2_HOME? Yes
    
    ? PM2_HOME value (this path should be accessible to the service user and should not contain any “user-context” variables [e.g. %APPDATA%]): c:\etc\.pm2\
    
    ? Set PM2_SERVICE_SCRIPTS (the list of start-up scripts for pm2)? No 👿 
    
    ---> If PM2_SERVICE_SCRIPTS is not set, then the default behaviour is to call "pm2 resurrect" on service startup - when PM2 is running with the list of processes you want launched by the service, use pm2 save to dump the process list, ready for the service to           restore it when it next starts.
    
    ? Set PM2_SERVICE_PM2_DIR (the location of the global pm2 to use with the service)? [recommended] Yes
    
    ? Specify the directory containing the pm2 version to be used by the service C:\USERS\<USER>\APPDATA\ROAMING\NPM\node_modules\pm2\index.js
    
    PM2 service installed and started.
    
    This will create a Windows Service called PM2

    ![image](https://github.com/user-attachments/assets/fbaaba00-9644-47e0-9676-bd20c83a6b77)

    To test:
    
    1. Restart Windows
    
    2. Just after restart, open command prompt (as Administrator) and run: pm2 status → our application is running ;)
    
    Reference link: https://blog.cloudboost.io/nodejs-pm2-startup-on-windows-db0906328d75
