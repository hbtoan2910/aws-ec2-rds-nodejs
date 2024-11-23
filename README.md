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

   Then connect this database with our already-created instance

   ![image](https://github.com/user-attachments/assets/0ba4a1cd-7ed6-4e86-8669-5227aead452b)

  
6. If trying to access using Public IPv4 address you will see it failed. Need to do 2 more steps:

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


  
