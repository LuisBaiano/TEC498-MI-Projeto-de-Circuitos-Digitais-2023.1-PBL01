module matriz_colunas (CH3, CH4, CH5, CH6, CH7, C1,C2,C3,C4,C5);
    
	 input CH3, CH4, CH5, CH6, CH7;
	 output C1,C2,C3,C4,C5;
	 
	 //Como não há necessidade de codificação entre as chaves e as colunas da matriz de leds,
	 //podemos relacionar as chaves, diretamente às pinagens das colunas.

    assign C1 = CH7;
    assign C2 = CH6;
    assign C3 = CH5;
    assign C4 = CH4;
    assign C5 = CH3;

endmodule
