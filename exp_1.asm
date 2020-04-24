#INCLUDE <P18F452.INC>

			ORG		0x00; Diretiva do compilador
			ORG		0x08; Vetor de end, da interropção
			RETFIE

LERBOTAO	BTFSC	PORTA, RA0;
			GOTO	APAGA;
			BSF		LATB, 0;
			GOTO	LERBOTAO;
APAGA		BCF		LATB, 0;
			GOTO	LERBOTAO;
END
