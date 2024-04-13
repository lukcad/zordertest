namespace org.lukcad;

aspect cuid {
  key ID : UUID;
}

entity Orders: cuid {
  comment: String;
  Items : Composition of many OrderItems
            on Items.parent = $self;
}

entity OrderItems { // to be accessed through Orders only
  key parent   : Association to Orders;
  key pos      : Integer;
      quantity : Integer;
}
