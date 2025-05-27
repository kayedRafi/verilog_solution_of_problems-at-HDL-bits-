module top_module ( 
    input [15:0] a, b,
    input cin,
    output cout,
    output [15:0] sum );
    wire [3:0]  c;
    genvar i;
    bcd_fadd fa0(a[3:0],b[3:0],cin,c[0],sum[3:0]);
    generate 
        for(i=1;i<4;i=i+1) begin:lp
            bcd_fadd fa(a[4*i+3:4*i],b[4*i+3:4*i],c[i-1],c[i],sum[4*i+3:4*i]);
            end
        endgenerate
    assign cout= c[3];
endmodule
