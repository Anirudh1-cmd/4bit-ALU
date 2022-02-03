/********************************************************************************************
Copyright 2019 - Maven Silicon Softech Pvt Ltd. 

All Rights Reserved.

This source code is an unpublished work belongs to Maven Silicon Softech Pvt Ltd.

It is not to be shared with or used by any third parties who have not enrolled for our paid training 

courses or received any written authorization from Maven Silicon.


Webpage     :      www.maven-silicon.com

Filename    :	   alu.v   

Description :      Arithmetic Logic Unit Design

Author Name :      Susmita

Version     :      1.0
*********************************************************************************************/

module alu(input[7:0]a,b,
			input[3:0]command_in,
			input oe ,
			output[15:0]dout);

			
	parameter		ADD = 4'b0000,
				INC = 4'b0001,
				SUB = 4'b0010,
				DEC = 4'b0011,
				MUL = 4'b0100,
				DIV = 4'b0101,
				SHL = 4'b0110,
				SHR = 4'b0111,
				AND = 4'b1000,
				OR  = 4'b1001,
				INV = 4'b1010,
				NAND = 4'b1011,
				NOR = 4'b1100,
				XOR = 4'b1101,
				XNOR = 4'b1110,
				BUF = 4'b1111;
				
	reg [15:0]out;
	
	
	always @ (*)
	begin
	case(command_in)
			ADD		: out = a + b;
			INC		: out = a + 1'b1;
			SUB		: out = a - b;
			DEC		: out = a - 1'b1;
			MUL		: out = a * b;
			DIV		: out = a / b;
			SHL		: out = a << 1'b1;
			SHR		: out = a >> 1'b1;
			INV		: out = !(a); 
			AND		: out = a && b;
			OR		: out = a || b;
			NAND		: out = ~(a & b);
			NOR		: out = ~(a | b);
			XOR		: out = a ^ b;
			XNOR		: out = a ~^ b;
			BUF		: out = a ;
			endcase
			end
			
			assign dout = (oe) ? out : 16'hzzzz;
			
	endmodule
	
