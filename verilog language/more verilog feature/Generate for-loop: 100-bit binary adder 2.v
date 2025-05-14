module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign {sum,cout}={a^b^cin,((a&b)|(b&cin)|(a&cin))};
endmodule
module top_module( 
    input [99:0] a, b,
    input cin,
    output [99:0] cout,
    output [99:0] sum );
   genvar g;
   full_adder fa0(a[0],b[0],cin,sum[0],cout[0]);
   generate
    for (g =1 ;g<100 ;g=g+1 ) begin:lp
        full_adder fa(a[g],b[g],cout[g-1],sum[g],cout[g]);
    end
   endgenerate
endmodule