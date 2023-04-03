# CSE490
-------------------
About
-------------------
Project Description: Create an 8-bit processor with a single-cycle, non-pipelined design with Verilog.

Contributor List: Kyle Lemma, Caroline Hart, Cristian Pompey, U Shin

--------------------
Progress Report
--------------------
  - Each Required component has a module created in Verilog code that will be used to carry out of the defined task. All individual modules are working separately as configured with their corresponding test benches.
    - As of right now we are working on piecing all modules together to confine to the data path we have created. We are also working on a test bench for the full processor design and will be testing and tweaking our implementation in the upcoming week.
	
	--------------------
	Components Implemented
	--------------------
	All Modules listed below have a working Verilog Design and Testbench that have been working independently of the others:
	- Instruction Memory
	- Data Memory
	- Register File
	- ALU
	- Sign Extension
	- Control Unit
	- Multiplexer
	- Program Counter
	
	Furthermore the module mips_cpu_8 has been implemented a the root  of the project to simulate the actual cpu with all of the aforementioned connected components.
	- mips_cpu_8
	--------------------
	Resources and References
	--------------------
