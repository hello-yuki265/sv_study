module tb_sim ();
// ===========package import ==========
import class_def::Stim;
import class_def::Days;

// ===========func define ===========
`define SV_RANDOM_CHECK(r) \
    do begin \
        if(!r) begin \
            $display("%s:%d: Randomization failed \"%s\"",  \
            `__FILE__, `__LINE__, `"r`");  \
        $finish; \
        end \
    end while(0)

// =======task define=====
    task rand_day;
        automatic Days days = new();
        days.choices = {Days::SUN, Days::SAT, Days::MON};
        `SV_RANDOM_CHECK(days.randomize());
        $display("Random weekend day %s\n", days.choice.name());
        days = null;
    endtask

    initial begin
        repeat(10) rand_day;
    end


endmodule