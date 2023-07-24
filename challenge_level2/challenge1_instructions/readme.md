The test configuration was using rv64m instructions, which are not supported in RV32I.
By not using this instructions the test passes correctly. 