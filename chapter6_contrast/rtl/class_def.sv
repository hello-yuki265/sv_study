package class_def;

    class Stim;
        const bit [31 : 0] CONGEST_ADDR = 42;
        typedef enum {READ, WRITE, CONTROL} stim_e;
        randc stim_e kind;    //枚举随机
        rand bit [31 : 0] len, src, dst;
        rand bit congestion_test;


        constraint c_stim {
            ! (len inside {[0 : 1000]});
            if (congestion_test){
                dst inside {[CONGEST_ADDR-10 : CONGEST_ADDR+10]};
                src == CONGEST_ADDR;
            }
            else {
                src inside {0, [2:10], [100:107]};
            }
        }
    endclass: Stim

    class Days;
        typedef enum {
            SUN, MON, TUE, WED,
            THU, FRI, SAT
        }days_e;

        days_e choices[$];
        rand days_e choice;

        constraint cdays {
            choice inside {choices};
        }
    endclass: Days;


endpackage