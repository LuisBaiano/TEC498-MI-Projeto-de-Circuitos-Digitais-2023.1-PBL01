module verificador2de5 (CH7, CH6, CH5, CH4, CH3, erro);
	
	input CH7, CH6, CH5, CH4, CH3; //Código 2 de 5
	output erro; //0 = Código válido, 1 = Código inválido
	
	wire cout1, cout2, cout3, cout4, //carry de saída 
   ncout4, ns3, //inversores
	s1, s2, s3, s4;  //resultado das somas
	
	//Somadores para contar quantos uns tem no codigo inserido
	somador soma1(.A(CH7), .B(CH6), .Cin(CH5), .Co(cout1), .S(s1));
	somador soma2(.A(CH4), .B(CH3), .Cin(1'b0), .Co(cout2), .S(s2));
	somador soma3(.A(s1), .B(s2), .Cin(1'b0), .Co(cout3), .S(s3));
	somador soma4(.A(cout1), .B(cout2), .Cin(cout3), .Co(cout4), .S(s4));
	
	//inverte carry de saída 4 e resultado da soma 3
	not(ncout4, cout4);
	not(ns3, s3);
	
	nand(erro, ncout4, s4, ns3); //se algum desses 3 bits for 0, o 
										//nand manda 1 e classifica erro ( código inválido )

endmodule
