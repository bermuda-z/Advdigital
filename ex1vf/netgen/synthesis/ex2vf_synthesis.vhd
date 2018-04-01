--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: ex2vf_synthesis.vhd
-- /___/   /\     Timestamp: Mon Jan 22 13:45:54 2018
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm ex2vf -w -dir netgen/synthesis -ofmt vhdl -sim ex2vf.ngc ex2vf_synthesis.vhd 
-- Device	: xc3s400-4-tq144
-- Input file	: ex2vf.ngc
-- Output file	: C:\Users\Bermuda\Desktop\ch2v\ex1vf\netgen\synthesis\ex2vf_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: ex2vf
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity ex2vf is
  port (
    C : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    A : in STD_LOGIC_VECTOR ( 2 downto 0 ); 
    B : in STD_LOGIC_VECTOR ( 2 downto 0 ) 
  );
end ex2vf;

architecture Structure of ex2vf is
  signal A_0_IBUF_3 : STD_LOGIC; 
  signal A_1_IBUF_4 : STD_LOGIC; 
  signal A_2_IBUF_5 : STD_LOGIC; 
  signal B_0_IBUF_9 : STD_LOGIC; 
  signal B_1_IBUF_10 : STD_LOGIC; 
  signal B_2_IBUF_11 : STD_LOGIC; 
  signal C_0_OBUF_16 : STD_LOGIC; 
  signal C_1_OBUF_17 : STD_LOGIC; 
  signal C_2_OBUF_18 : STD_LOGIC; 
  signal Madd_C_cy : STD_LOGIC_VECTOR ( 2 downto 1 ); 
begin
  Madd_C_lut_0_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => A_0_IBUF_3,
      I1 => B_0_IBUF_9,
      O => C_0_OBUF_16
    );
  A_2_IBUF : IBUF
    port map (
      I => A(2),
      O => A_2_IBUF_5
    );
  A_1_IBUF : IBUF
    port map (
      I => A(1),
      O => A_1_IBUF_4
    );
  A_0_IBUF : IBUF
    port map (
      I => A(0),
      O => A_0_IBUF_3
    );
  B_2_IBUF : IBUF
    port map (
      I => B(2),
      O => B_2_IBUF_11
    );
  B_1_IBUF : IBUF
    port map (
      I => B(1),
      O => B_1_IBUF_10
    );
  B_0_IBUF : IBUF
    port map (
      I => B(0),
      O => B_0_IBUF_9
    );
  C_3_OBUF : OBUF
    port map (
      I => Madd_C_cy(2),
      O => C(3)
    );
  C_2_OBUF : OBUF
    port map (
      I => C_2_OBUF_18,
      O => C(2)
    );
  C_1_OBUF : OBUF
    port map (
      I => C_1_OBUF_17,
      O => C(1)
    );
  C_0_OBUF : OBUF
    port map (
      I => C_0_OBUF_16,
      O => C(0)
    );
  Madd_C_cy_1_11 : LUT4
    generic map(
      INIT => X"EA80"
    )
    port map (
      I0 => A_1_IBUF_4,
      I1 => A_0_IBUF_3,
      I2 => B_0_IBUF_9,
      I3 => B_1_IBUF_10,
      O => Madd_C_cy(1)
    );
  Madd_C_xor_1_11 : LUT4
    generic map(
      INIT => X"963C"
    )
    port map (
      I0 => A_0_IBUF_3,
      I1 => A_1_IBUF_4,
      I2 => B_1_IBUF_10,
      I3 => B_0_IBUF_9,
      O => C_1_OBUF_17
    );
  Madd_C_cy_2_11 : LUT3
    generic map(
      INIT => X"E8"
    )
    port map (
      I0 => A_2_IBUF_5,
      I1 => B_2_IBUF_11,
      I2 => Madd_C_cy(1),
      O => Madd_C_cy(2)
    );
  Madd_C_xor_2_11 : LUT3
    generic map(
      INIT => X"96"
    )
    port map (
      I0 => A_2_IBUF_5,
      I1 => B_2_IBUF_11,
      I2 => Madd_C_cy(1),
      O => C_2_OBUF_18
    );

end Structure;

