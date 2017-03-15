LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;

PACKAGE OPCodes IS
  
  SUBTYPE OPCodeType IS STD_LOGIC_VECTOR(3 DOWNTO 0);
  
  CONSTANT mov   : OPCodeType := "1111";
  CONSTANT sta   : OPCodeType := "1100"; --MOV @A reg
  CONSTANT lda   : OPCodeType := "0010"; --MOV reg @A
  CONSTANT movi  : OPCodeType := "0101"; --2 Bytes
  CONSTANT adda  : OPCodeType := "0100";
  CONSTANT suba  : OPCodeType := "1101";
  CONSTANT inc   : OPCodeType := "1000";
  CONSTANT dec   : OPCodeType := "0011";
  CONSTANT anda  : OPCodeType := "0111";
  CONSTANT ora   : OPCodeType := "1001";
  CONSTANT no    : OPCodeType := "1011"; --NOT operator
  CONSTANT jnz   : OPCodeType := "0000"; --2 Bytes
  CONSTANT call  : OPCodeType := "0110"; --2 Bytes
  CONSTANT ret   : OPCodeType := "1010";
  CONSTANT jmp   : OPCodeType := "1110"; --2 Bytes
  CONSTANT nop   : OPCodeType := "0001";
    --Microprocessor opcodes
  
  SUBTYPE RegisterType IS STD_LOGIC_VECTOR(1 DOWNTO 0);
  
  CONSTANT A     : RegisterType := "00";
  CONSTANT B     : RegisterType := "01";
  CONSTANT C     : RegisterType := "10";
  CONSTANT D     : RegisterType := "11";
    --Microprocessor registers
    
END OPCodes;