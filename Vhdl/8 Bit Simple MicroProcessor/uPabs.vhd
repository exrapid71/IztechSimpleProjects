LIBRARY IEEE;
  USE IEEE.STD_LOGIC_1164.ALL;

ENTITY uPabs IS PORT(
  clk, reset, int  : IN STD_LOGIC;
  DataBus          : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  intA, wr, rd     : OUT STD_LOGIC;
  AdressBus        : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
END uPabs;

ARCHITECTURE STRUCTURAL_uPabs OF uPabs IS
  
  COMPONENT CONTROL_UNIT IS PORT(
    Cclk, Creset, CAeq, Cint : IN STD_LOGIC;
    CIR : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    Cwr, Crd, CintA, Cpush, Cpop, CPCLoad, CDir, CjmpMux, CopFetch, Cwe, Crbe : OUT STD_LOGIC;
    CALUSel : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
    CAsel, CSsel : OUT STD_LOGIC_VECTOR(1 DOWNTO 0);
    CIRLoad, CEn : OUT STD_LOGIC_VECTOR(1 TO 2));
  END COMPONENT;
  
  COMPONENT Datapath IS PORT(
    Dclk, DPCLoad, DPCReset, Dpush, Dpop, DopFetch, DEn1, DEn2, DDir, Dwe, Drbe, DRegFileReset, DStackReset, DjmpMux : IN STD_LOGIC;
    DAsel, DSsel: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
    DIRLoad, DIRReset : IN STD_LOGIC_VECTOR(1 TO 2);
    DALUSel : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
    DDaBus : INOUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DAeq : OUT STD_LOGIC;
    DAdBus, DIRout : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    DRA, DRB, DPC : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
  END COMPONENT;
  
  SIGNAL Asel, Ssel, IRreset : STD_LOGIC_VECTOR(1 DOWNTO 0);
  SIGNAL IRLoad, En : STD_LOGIC_VECTOR(1 TO 2);
  SIGNAL IR  : STD_LOGIC_VECTOR(7 DOWNTO 0);
  SIGNAL ALUSel : STD_LOGIC_VECTOR(4 DOWNTO 0);
  SIGNAL Aeq, push, pop, PCLoad, Dir, jmpMux, opFetch, we, rbe : STD_LOGIC;
  SIGNAL RegFileA, RegFileB, ProgramCounter : STD_LOGIC_VECTOR(7 DOWNTO 0);
  
BEGIN
  IRreset <= reset&reset;
  CU : CONTROL_UNIT PORT MAP(clk, reset, Aeq, int, IR, wr, rd, intA, push, pop, PCLoad, Dir, jmpMux, opFetch
                             ,we, rbe, ALUSel, Asel, Ssel, IRLoad, En);
  DP : Datapath PORT MAP(clk, PCLoad, reset, push, pop, opFetch, En(1), En(2), Dir, we, rbe, reset, reset, jmpMux,
                         Asel, Ssel, IRLoad, IRreset, ALUSel, DataBus, Aeq, AdressBus, IR, RegFileA, RegFileB, ProgramCounter);
                         
  
END STRUCTURAL_uPabs;