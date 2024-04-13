using org from '../db/schema';

service main {
  entity Orders as projection on org.lukcad.Orders;
  entity OrderItems as projection on org.lukcad.OrderItems;
}