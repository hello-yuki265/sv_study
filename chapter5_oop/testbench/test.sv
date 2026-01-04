module automatic test(arb_if arbif);
    // initial begin
    //     @arbif.cb;
    //     arbif.cb.request <= 2'b01;
    //     $display("@%0t: Drove req = 01", $time);
    //     repeat(2) @arbif.cb;
    //     if (arbif.cb.grant == 2'b01)
    //         $display("@%0t: Success: grant == 2'b01", $time);
    //     else
    //         $display("@%0t: Error: grant != 2'b01", $time);
    // end

    initial begin
        $monitor("@%0t: grant = %h", $time, arbif.cb.grant);
        # 700ns;
        $display("End of test");
    end


endmodule   