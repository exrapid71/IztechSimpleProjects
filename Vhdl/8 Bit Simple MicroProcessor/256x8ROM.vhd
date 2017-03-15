--The below program, written into the ROM, is intended to calculate the 14th element of the famous
--Fibonacci Series. It calculates the fourteenth element, because an 8BIT register can hold
--maximum "11111111", which is decimal 255, and 14th element is actually 233(next element is 377 and 377>255).
LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;
  USE IEEE.STD_LOGIC_ARITH.ALL;
  USE IEEE.STD_LOGIC_UNSIGNED.ALL;
  USE IEEE.NUMERIC_STD.ALL;
LIBRARY WORK;
  USE WORK.OPCodes.ALL;

ENTITY Rom IS PORT(
  Adress : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
  CS : IN STD_LOGIC;
  Data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Rom;

ARCHITECTURE STRUCTURAL_ROM  OF Rom IS
  
  SUBTYPE cell IS STD_LOGIC_VECTOR(7 DOWNTO 0);
  TYPE ROMType IS ARRAY(0 TO 255) OF cell;
  
  CONSTANT ROM : ROMType := (
    movi & B & "XX", --This is a 2Byte instruction and after fetching this instruction, the next instruction
    "00000000",      --will be fetched to the second part of the IR. Register B is initialized to 00h.
    movi & C & "XX", --Similarly, register C is initialized to 01h. Please note that the register B is
    "00000001",      --initialized to first and C is initialized to second Fibonacci number.
    movi & D & "XX", --Register D is set to 0Ch. Register D is used as a loop variable. To get the 14th element
    "00001100",      --the loop should iterate 12 times(14-2 because 1st and 2nd are already defined).
    sta & B & "XX",  --The value of B is stored into accumulator.
    adda & C & "XX", --The value of C is added to the value of accumulator.
    mov & B & C,     --The number B is updated with the number C, meaning that Ci = Ci+1;
    mov & C & A,     --The number C is updated with the value of accumulator, meaning that Ci+1 = Ci+2;
    dec & D & "XX",  --The loop variable is decremented.
    sta & D & "XX",  --The new loop variable value is stored into accumulator to check if it reached to zero.
    jnz & "XXXX",    --Another 2Byte instruction. The purpose of this instruction is to change the flow of
    "11111001",      --execution and jump to the 06h instruction(6 previous), if accumulator is not zero..
    sta & C & "XX",  --After all these task, the requested value will be left in the accumulator
    OTHERS => (OTHERS => '0'));

BEGIN
  PROCESS(CS)
    BEGIN
      IF(CS = '1') THEN
        Data <= ROM(conv_integer(Adress));
      ELSE
        Data <= (OTHERS => 'Z');
      END IF;
    END PROCESS;
END STRUCTURAL_ROM;