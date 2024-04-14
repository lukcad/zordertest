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

module.exports = { mainsrv }