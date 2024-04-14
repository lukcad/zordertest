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

## DB model of backend

![image](https://github.com/lukcad/zordertest/assets/22641302/16080e63-b7c3-498a-8881-570569b568a1)

## Service model of OData

![image](https://github.com/lukcad/zordertest/assets/22641302/a1e2a7b5-3a5f-4246-8462-c10627f1916f)

## Example of event handlers on service level

~~~js
const cds = require('@sap/cds')

// prepare new value for pos when create new record in OrderItems.draft
async function genOrderItemsDraftPos(req) {
  if (req.data) {
    const {id} = await SELECT.one.from(req.target).columns('max(pos) as id') 
    req.data.pos = id + 1
  }
}

class mainsrv extends cds.ApplicationService {

  init() {

    // example of event handler for BEFORE UPDATE of entity Orders
    this.before("UPDATE", "Orders", (req) => this.onUpdateOrders(req.data));

    // example of event handler for after read of entity Order
    this.after("READ", "Orders", (results) => this.onReadOrders(results));

    // create event for calculating new pos for item in order in draft table
    this.before("CREATE", "OrderItems.drafts", genOrderItemsDraftPos);

    return super.init();
  }

  onUpdateOrders(data) {
    if (data.Items){
        for (let index = 0; index < data.Items.length; index++) {
          const element = data.Items[index];
          console.log(element);
        }
    }
  }

  onReadOrders(results) {
    if (results){
        for (let index = 0; index < results.length; index++) {
          const element = results[index];
          console.log(element);
        }
    }
  }
}

~~~

## Fiori Pages

Orders list:

![image](https://github.com/lukcad/zordertest/assets/22641302/dd7e2a8e-68e8-4cc9-b09e-ff8ca7f1e65d)

Order with Items:

![image](https://github.com/lukcad/zordertest/assets/22641302/656e08a4-e3de-4dbe-9c87-ce8a7aebfc6d)

Order in Edit mode:

![image](https://github.com/lukcad/zordertest/assets/22641302/fa548651-0fb9-4be4-9ca1-cea1fe6c167b)

Add new item during edit mode:

![image](https://github.com/lukcad/zordertest/assets/22641302/407fefa4-f8e3-45f4-86d8-a1f358ba6484)

![image](https://github.com/lukcad/zordertest/assets/22641302/3a03b511-9258-4b5b-8502-d569fbb6675b)

Studidng this project you can find how generate new `pos` value during cretaing Item of Order in Draft mode.

Happy progremming,

Thank you,

Mikhail.

## Learn More

Learn more about CAP CDS at https://cap.cloud.sap/docs/get-started/.
