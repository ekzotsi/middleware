#!/bin/bash

#Author: Edem, July 9 2022

## Clean up the system by removing any old version of docker

     sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine
       if
          [ $? -ne 0 ]
          then
              echo " Command not Found, Please try again"
           exit 1
       fi

# Setup the docker repository

   sudo yum install -y yum-utils
     if
       [ $? -ne 0 ]
       then
       echo " Command not Found"
       exit 2
       else
            sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
     fi

 ## Install the docker engine

       sudo yum install docker-ce docker-ce-cli containerd.io -y
       if
        [ $? -ne 0 ]
        then
          echo "The installation failed"
             exit 3
         else
            echo " Installation of docker successful"
       fi

   ## Start and enable docker daemon
 
         sudo systemctl start docker
          if [$? -ne 0]
             then
                echo "Command not found"
                exit 4
          fi
        
          sudo systemctl enable docker
          if [$? -ne 0]
             then
                echo "Command not found"
                exit 5
          fi

     # Check the status of the daemon to make sure it is up and running
 
         sudo systemctl status docker
         if
            [ $? -ne 0 ]
             then
               echo " Command not found"
               exit 6
         fi

