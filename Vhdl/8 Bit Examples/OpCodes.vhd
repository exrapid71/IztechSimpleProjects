library ieee;
use ieee.std_logic_1164.all;

package OpCodes is 

	subtype OpCodeType is std_Logic_Vector(3 downto 0);

	constant mov  : OpCodeType := "1111";
	constant wrt  : OPCodeType := "1100";--write
	constant rd   : OPCodeType := "0010";--read
	constant movi : OPCodeType := "0101";
	constant adda : OPCodeType := "0100";
	constant suba : OPCodeType := "1101";
 	constant inc  : OPCodeType := "1000";
	constant dec  : OPCodeType := "0011";
	constant anda : OPCodeType := "0111";
	constant ora  : OPCodeType := "1001";
	constant nt   : OPCodeType := "1011";
	constant jnz  : OPCodeType := "0000";
	constant call : OPCodeType := "0110";
	constant ret  : OPCodeType := "1010";
	constant jmp  : OPCodeType := "1110";
	constant nop  : OPCodeType := "0001";

  	subtype RegisterType is std_logic_vector(1 downto 0);
  
  	CONSTANT A     : RegisterType := "00";
  	CONSTANT B     : RegisterType := "01";
  	CONSTANT C     : RegisterType := "10";
  	CONSTANT D     : RegisterType := "11";

end OpCodes;
