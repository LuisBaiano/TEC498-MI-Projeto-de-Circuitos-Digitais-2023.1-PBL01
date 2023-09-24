module matriz_linhas (CH2, CH1, CH0, valido, matriz_ou_display,L0,L1,L2,L3,L4,L5,L6);

	input CH2, CH1, CH0,valido; //se valido == 1 ( codigo binário inválido ), 
										//nenhuma linha liga ( fica 1111111 ) por ser or
	
	output matriz_ou_display; //nenhuma linha liga = 1 ( exibe display ), liga alguma linha = 0 ( exibe matriz )
	output L0,L1,L2,L3,L4,L5,L6;   //as 7 linhas da matriz
	
	//Inverter
	wire nCH2, nCH1, nCH0;
	
	//inversoras
	not(nCH2, CH2);
	not(nCH1, CH1);
	not(nCH0, CH0);
	
	//matriz_ou_display
	and(matriz_ou_display, nCH2, nCH1, nCH0);
	
	//linha 1
	or(L0, CH2, CH1, nCH0, valido); //001
	
	//linha 2
	or(L1, CH2, nCH1, CH0, valido); //010
	
	//linha 3
	or(L2, CH2, nCH1, nCH0, valido); //011
	
	//linha 4
	or(L3, nCH2, CH1, CH0, valido); //100
	
	//linha 5
	or(L4, nCH2, CH1, nCH0, valido); //101
	
	//linha 6
	or(L5, nCH2, nCH1, CH0, valido); //110
	
	//linha 7
	or(L6, nCH2, nCH1, nCH0, valido); //111

endmodule
