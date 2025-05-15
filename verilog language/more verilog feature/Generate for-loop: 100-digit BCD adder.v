/*module full_adder(a,b,cin,sum,cout);
input a,b,cin;
output sum,cout;
assign {sum,cout}={a^b^cin,((a&b)|(b&cin)|(a&cin))};
endmodule
module bcd_fadd (
    input [3:0] a,
    input [3:0] b,
    input     cin,
    output   cout,
    output [3:0] sum );
    wire [2:0] t;
    full_adder fa0(a[0],b[0],cin,sum[0],t[0]);
    full_adder fa1(a[1],b[1],t[0],sum[1],t[1]);
    full_adder fa2(a[2],b[2],t[1],sum[2],t[2]);
    full_adder fa3(a[3],b[3],t[2],sum[3],cout);
    endmodule
    */
module top_module( 
    input [399:0] a, b,
    input cin,
    output cout,
    output [399:0] sum );
    wire [99:0] carry;
  
    genvar i;
    bcd_fadd u0(a[3:0],b[3:0],cin,carry[0],sum[3:0]);
    generate
        for ( i=1;i<100 ;i=i+1) begin:lp
         bcd_fadd Ui( a[((i+1)*4)-1:(i*4)],b[((i+1)*4)-1:(i*4)],carry[i-1],carry[i],sum[((i+1)*4)-1:(i*4)]);
        end
        
    endgenerate
assign cout=carry[99];

endmodule
