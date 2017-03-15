LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Datapath IS PORT(
  Dclk, DPCLoad, DPCReset, Dpush, Dpop, DopFetch, DEn1, DEn2, DDir, Dwe, Drbe, DRegFileReset, DStackReset, DjmpMux : IN STD_LOGIC;
  DAsel, DSsel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
  DIRLoad, DIRReset : IN STD_LOGIC_VECTOR(1 TO 2);
  DALUSel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
  DDaBus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  DAeq : OUT STD_LOGIC;
  DAdBus, DIRout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  DRA, DRB, DPC : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END Datapath;

ARCHITECTURE STRUCTURAL_DATAPATH OF Datapath IS
  
  COMPONENT STACK IS PORT(
    clk       : IN STD_LOGIC;
    push      : IN STD_LOGIC;
    pop       : IN STD_LOGIC;
    reset     : IN STD_LOGIC;
    inputST   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    outputST  : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT PCNEXT IS PORT(
    clk, PCLoad, PCReset, jmpMux : IN STD_LOGIC;
    dataBus1_0, Ssel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    irIn, StackIN  : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    PCout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT IR_2BYTE IS PORT(
    irClk : IN STD_LOGIC;
    irLoad1 : IN STD_LOGIC;
    irLoad2 : IN STD_LOGIC;
    irReset1 : IN STD_LOGIC;
    irReset2 : IN STD_LOGIC;
    irInput : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    outputIR1 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    outputIR2 : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT ALU_8BIT IS PORT(
      sel :   IN STD_LOGIC_VECTOR(4 DOWNTO 0);
      a,b :   IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      f   :  OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
      unsignedOverflow : OUT STD_LOGIC;
      signedOverflow : OUT STD_LOGIC;
      carry, zero : OUT STD_LOGIC);     
  END COMPONENT;
  
  COMPONENT REGFILE IS PORT(
    clk, rbe, reset, we : IN STD_LOGIC;
    wa, RBA             : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    d                   : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    portA, portB        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT ADRESSBUS IS PORT(
   enable : IN STD_LOGIC;
   input : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
   output : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT Rom IS PORT(
    Adress : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    CS : IN STD_LOGIC;
    Data : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT DATABUS IS PORT(
   direction, enable : IN STD_LOGIC;
   dataOut, dataIn : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  COMPONENT MUX IS PORT(
    sel : IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    x0,x1,x2,x3 : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    y : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL DPCout, STACKoutPCin, ROMoutIRin, IR1out, IR2out, DAdress, MUXoutALUin : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL REGFILEoutADRESSBUSin, REGFILEoutDATABUSin, ALUoutREGFILEin : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL Dunsigned, Dsigned, Dcarry, Dzero : STD_LOGIC;
  
BEGIN
  PCNextComp : PCNEXT PORT MAP(Dclk, DPCLoad, DPCReset, DjmpMux, DDaBus(1 DOWNTO 0), DSsel, IR2out, STACKoutPCin, DPCout);
  StackComp : STACK PORT MAP(Dclk, Dpush, Dpop, DStackReset, DPCout, STACKoutPCin);
  ROMComp : Rom PORT MAP(DPCout, DopFetch, ROMoutIRin);
  IRComp : IR_2BYTE PORT MAP(Dclk, DIRLoad(1), DIRLoad(2), DIRReset(1), DIRReset(2), ROMoutIRin, IR1out, IR2out);
  mux3Comp : MUX PORT MAP(DAsel, REGFILEoutDATABUSin, "00000000", IR2out, REGFILEoutADRESSBUSin, MUXoutALUin);
  ALUComp : ALU_8BIT PORT MAP(DALUSel, MUXoutALUin, REGFILEoutDATABUSin, ALUoutREGFILEin, Dunsigned, Dsigned, Dcarry, Dzero);
  RegFileComp : REGFILE PORT MAP(Dclk, Drbe, DRegFileReset, Dwe, IR1out(3 DOWNTO 2), IR1out(1 DOWNTO 0), ALUoutREGFILEin, REGFILEoutADRESSBUSin, REGFILEoutDATABUSin);
  AdressBusComp : ADRESSBUS PORT MAP(DEn1, DAdress, DAdBus);
  DataBusComp : DATABUS PORT MAP(DDir, DEn2, DDaBus, REGFILEoutDATABUSin);
    
  DAeq <= Dzero;
  DIRout <= IR1out;
  DPC <= DPCout;
  DRA <= Regfileoutadressbusin;
  DRB <= regfileoutdatabusin;
END STRUCTURAL_DATAPATH;