**First error:**
test.S:15855: Error: illegal operands `and s7,ra,z4'
The problem is that z4 does not exist. Changed to s4.

**Second error:**
test.S:25584: Error: illegal operands `andi s5,t1,s0'
ANDI instruction requires an immediate value and not two source registers. Changed s0 to 5 (arbitrary number)