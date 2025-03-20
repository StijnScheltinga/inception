# Inception
This project improves your knowledge of system administration by using docker to containerize an Nginx, Wordpress and Mariadb application and orchestrating them using Docker compose.

![image](https://github.com/user-attachments/assets/83948cf5-02ff-4021-bc1d-18d4e894304d)

The image above is an overview of the application. 
Each application is in it's own isolated container with the Nginx container being the only entrypoint to the outside world and making use of volumes to ensure persistant storage.
All the setup is handled in custom docker files, using startup scripts and preconfigured config files.

## usage

Ofcourse, having Docker installed on your system is a prerequisite.

Fill in a `.env` file with the desired credentials and place it in the **srcs** folder.

![image](https://github.com/user-attachments/assets/e37525c8-f41b-4d5a-ae00-b97c927daec6)

Bind the volumes to a directory of your choosing in the docker-compose file.

![image](https://github.com/user-attachments/assets/c3b01896-4d44-4362-b068-bb39015398ce)

All that's left to do is run make in the project root and the multi-container application is now up and running! 🚀
