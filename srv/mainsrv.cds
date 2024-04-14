using org from '../db/schema';

service mainsrv {

  @odata.draft.enabled
  entity Orders as projection on org.lukcad.Orders;
  
  entity OrderItems as projection on org.lukcad.OrderItems;
}



