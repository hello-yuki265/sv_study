module arb_dummy(arb_if arbif);
    initial begin
        fork
            # 70ns arbif.grant = 1;
            # 170ns arbif.grant = 2;
            # 250ns arbif.grant = 3;
        join
    end


endmodule