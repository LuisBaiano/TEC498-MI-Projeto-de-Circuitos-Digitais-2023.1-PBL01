module main (CH7, CH6, CH5, CH4, CH3, CH2, CH1, CH0, matriz_L, matriz_C, segA, segB, segC, segD, segE, segF, segG, dig1, dig2, dig3, dig4, ponto);

	input CH7, CH6, CH5, CH4, CH3; //codigo binario 2 de 5
	input CH2, CH1, CH0;     //chaves para escolha da linha da matriz
	
	output [6:0] matriz_L;    //linhas da matriz
	output [4:0] matriz_C;	  //colunas da matriz
	output dig1, dig2, dig3, ponto;   //digitos do display de 7seg e o ponto para deixar sempre desligados
	output dig4;	//digito para ligar caso escolha exibir no display ou caso o código binario esteja errado
	output segA,segB,segC,segD,segE,segF,segG; //segmentos do display de 7seg
	
	wire on_off, //recebe os bits do modulo verificador2de5 e do matriz_linhas, e liga ou não liga o display de 7seg ( dígito 4 )
	chave_000, //saída do modulo matriz_linhas (1 = não liga linha alguma, 0 = liga alguma linha da matriz)
	error; //saída do modulo verificador2de5 (1 = Código binário inválido, 0 = Código binário válido)
	
	//deixa os digitos não utilizados e o ponto do display 7seg off
	buf (dig1, 1'b1);
   buf (dig2, 1'b1);
   buf (dig3, 1'b1);
   buf (ponto, 1'b1);
	
	//relaciona o codigo 2 de 5 com as colunas da matriz
	matriz_colunas (.CH3(CH3), .CH4(CH4), .CH5(CH5), .CH6(CH6), .CH7(CH7), .C1(matriz_C[0]), 
	.C2(matriz_C[1]), .C3(matriz_C[2]), .C4(matriz_C[3]), .C5(matriz_C[4]));
	
	//verfica se o codigo 2 de 5 inserido é válido
	verificador2de5 (.CH7(CH7), .CH6(CH6), .CH5(CH5), .CH4(CH4), .CH3(CH3), .erro(error));
	
	//converte o codigo inserido para os segmentos do display de 7seg
	display7seg (.CH7(CH7),.CH6(CH6),.CH5(CH5),.CH4(CH4),.CH3(CH3),.valido(error),.sA(segA),
	.sB(segB),.sC(segC),.sD(segD),.sE(segE),.sF(segF),.sG(segG));
	
	//caso as chaves estejam em 000 ( bit 1 ) ou o código 2 de 5 inserido for inválido ( bit 1 ), liga o display de 7seg
	or (on_off, error, chave_000); 
   not (dig4, on_off); //digito 4 do display de 7seg liga ou desliga
	
	//caso as chaves estejam DIFERENTE de 000 e o código inserido seja válido, envia o código para a matriz
	matriz_linhas (.CH2(CH2), .CH1(CH1), .CH0(CH0), .valido(error), .matriz_ou_display(chave_000), .L0(matriz_L[0]), 
	.L1(matriz_L[1]), .L2(matriz_L[2]), .L3(matriz_L[3]), .L4(matriz_L[4]), .L5(matriz_L[5]), .L6(matriz_L[6]));
	
	endmodule
	