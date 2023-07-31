# See LICENSE for license details.

#*****************************************************************************
# add.S
#-----------------------------------------------------------------------------
#
# Test add instruction.
#

#include "riscv_test.h"
#include "test_macros.h"

RVTEST_RV32M
RVTEST_CODE_BEGIN

  #-------------------------------------------------------------
  # Arithmetic tests
  #-------------------------------------------------------------
  
 
  li s1,0xffffffff
 

  
  ori s2,s1,0
  ori s2,s1,1
  ori s2,s1,2
  ori s2,s1,3
  ori s2,s1,4
  ori s2,s1,5
  ori s2,s1,6
  ori s2,s1,7
  ori s2,s1,8
  ori s2,s1,9
  
  
  
  ori s2,s1,-1
  ori s2,s1,-2
  ori s2,s1,-3
  ori s2,s1,-4
  ori s2,s1,-5
  ori s2,s1,-6
  ori s2,s1,-7
  ori s2,s1,-8
  ori s2,s1,-9

  li s3,-9
  li s4,10
  loop_or:
  or s2,s1,s3
  addi s3,s3,1
  bne s3,s4,loop_or

 

TEST_RR_OP( 2,  add, 0x00000001, 0x00000001, 0x00000000 );
TEST_PASSFAIL

RVTEST_CODE_END

  .data
RVTEST_DATA_BEGIN

  TEST_DATA

RVTEST_DATA_END
