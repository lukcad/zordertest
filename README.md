# zordertest

## Overview

`zordertest` is full-stack project which has:

- small CAP project of OData service with simple model by composition between orders and items. 
  
- UI `Orders` based on Fiori Elements.

## how to use


- **Prepare local environment** into your VS code, you can use dockerized environment which is prepared by mere from this repository: [caplukcadhf.git](https://github.com/lukcad/caplukcadhf.git)
- Clone this project to your prepared local environment by VS code using terminal:
  
      git clone https://github.com/lukcad/zordertest.git


- Open project as itself:
  
      code zordertest

- In opened project by VS code open terminal and run
   
      npm i

- Initialize local persistence sqlite database `zordertest.sqlite` by run

      cds deploy

- run applicaiton by using

      cds w

- Explore applicaiton by http://localhost:4004


## Learn More

Learn more at https://cap.cloud.sap/docs/get-started/.
