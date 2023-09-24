module display7seg (CH7,CH6,CH5,CH4,CH3,valido,sA,sB,sC,sD,sE,sF,sG);

	input CH7,CH6,CH5,CH4,CH3,valido; //codigo 2 de 5 e validez do codigo digitado
	output sA,sB,sC,sD,sE,sF,sG;   //segmentos do display 7seg
	
	wire nCH7,nCH6,nCH5,nCH4,nCH3, //inversoras do código 2 de 5
	n0,n1,n2,n3,n4,n5,n6,n7,n9;	//representação número do codigo 2 de 5
	
	//inversoras
	not(nCH7, CH7);
	not(nCH6, CH6);
	not(nCH5, CH5);
	not(nCH4, CH4);
	not(nCH3, CH3);
	
	//combinações do código 2 de 5 ( válidos )
   and (n0, nCH7,CH6,CH5,nCH4,nCH3); //01100  =   0
   and (n1, CH7,CH6,nCH5,nCH4,nCH3); //11000  =	  1
   and (n2, CH7,nCH6,CH5,nCH4,nCH3); //10100  =	  2
   and (n3, CH7,nCH6,nCH5,CH4,nCH3); //10010  =	  3
   and (n4, nCH7,CH6,nCH5,CH4,nCH3); //01010  =	  4
   and (n5, nCH7,nCH6,CH5,CH4,nCH3); //00110  =	  5
   and (n6, CH7,nCH6,nCH5,nCH4,CH3); //10001  =	  6	
   and (n7, nCH7,CH6,nCH5,nCH4,CH3); //01001  =	  7	
   and (n9, nCH7,nCH6,nCH5,CH4,CH3); //00011  =	  9
	
	//segmento A
	or(sA,n1,n4);
	
	//segmento B
	or(sB,n5,n6,valido);  //caso valido for igual 1, desliga B
	
	//segmento C
	or(sC,n2,valido); 	//caso valido for igual 1, desliga C
	
	//segmento D
	or(sD,n1,n4,n7,valido);	//caso valido for igual 1, desliga D
	
	//segmento E
	or(sE,n1,n3,n4,n5,n7,n9);
	
	//segmento F
	or(sF,n1,n2,n3,n7);
	
	//segmento G
	or(sG,n0,n1,n7);
	
endmodule
