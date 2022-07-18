module mux
(
  input  logic       clock  ,
  input  logic [3:0] ip1    ,
  input  logic [3:0] ip2    ,
  input  logic [3:0] ip3    ,
  input  logic       sel1   ,
  input  logic       sel2   ,
  input  logic       sel3   ,
  output logic [3:0] mux_op  
) ;

always @(posedge clock)
  if (sel1 == 1)
    mux_op <= ip1 ;
  else
    if (sel2 == 1)
      mux_op <= ip2 ;
    else
      if (sel3 == 1)
        mux_op <= ip3 ;

// Assertions go here

  default clocking defclk @(posedge clock) ;
  endclocking

  property SELECT1;
    @(posedge clock) (sel1 == 1'b1) |=> (mux_op == ip1);
  endproperty
  property SELECT2;
    @(posedge clock) (sel2 == 1'b1) |=> (mux_op == ip2);
  endproperty
  property SELECT3;
    @(posedge clock) (sel3 == 1'b1) |=> (mux_op == ip3);
  endproperty

  A1: assert property (SELECT1) ;
  A2: assert property (SELECT2) ;
  A3: assert property (SELECT3) ;

endmodule
