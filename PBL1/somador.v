module somador ( S, Co, A, B, Cin);
	
	input A, B, Cin; //3 bits para somar
	output S, Co;	//resultado da soma e carry de saída
	wire T1, T2, T3; //recebem as combinações das entradas
	
	xor Xor0(T1, A, B);
	and And0(T2, A, B);
	and And1(T3, T1, Cin);
	or Or0(Co, T2, T3);
	xor Xor1 (S, T1, Cin);

endmodule
