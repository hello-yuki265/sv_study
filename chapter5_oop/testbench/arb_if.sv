interface arb_if(input bit clk);
    logic [1 : 0] grant, request;
    bit rst;

    clocking cb @(posedge clk);
        output request;
        input grant;
    endclocking

    modport TEST (clocking cb, 
                  output rst);
    
    modport DUT (input request, rst, clk,
                 output grant);


endinterface: arb_if