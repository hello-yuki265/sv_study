module automatic sim_top;
    bit clk;
    always #50 clk = ~clk;

    arb_if arbif(clk);
    test u_test(arbif.TEST);
    arb_dummy u_arb_dummy(arbif.DUT);


endmodule