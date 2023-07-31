# RISCV-DV

Test generation using riscv-dv
```
run --target rv32i --test riscv_arithmetic_basic_test --testlist testlist.yaml --simulator pyflow
```

Coverage related information is obtained in the below link:
https://github.com/chipsalliance/riscv-dv/tree/master/pygen/pygen_src

# Challenge
The challenge is to fix the tool problem in generating coverage and make rv32i ISA coverage 100%

# Solution

To generate the tests using riscv-dv the following command has been used:
run --target rv32i --testlist testlist.yaml --simulator pyflow -v



To generate the coverage report, the following command has been used:
cov --dir out_2023-07-31/spike_sim/  --simulator=pyflow  --enable_visualization -v 
 * No target is given because the tool was not functioning properly for rv32i. Therefore the report includes more instructions than required, but at least the ones related to rv32i can be checked.


Due to this limitation in the coverage tool, the coverage is generated for an ISA bigger than rv32i, therefore it will always be less than 100%.

The rv32i_misc_cg has reached an 80% of coverage with the given tests.

Other details of the coverage can be found in the CoverageReport.txt, in cov_out_2023-07-31 folder

