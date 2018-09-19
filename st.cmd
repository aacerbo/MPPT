dbLoadDatabase("../../dbd/modbus.dbd")
modbus_registerRecordDeviceDriver(pdbbase)

 ## Use the following commands for serial RTU or ASCII
drvAsynSerialPortConfigure("MPPT", "/dev/ttyXRUSB0", 0, 0, 0)
asynSetOption("MPPT",0,"baud","115200")
asynSetOption("MPPT",0,"parity","none")
asynSetOption("MPPT",0,"bits","8")
asynSetOption("MPPT",0,"stop","1")

 ## Use the following command for serial RTU
modbusInterposeConfig("MPPT", 1, 500, 50)

 ##                     portName    tcpPortName slvAddr modbFnct modbStAddr modbLen modbDT pollMS plcType
 ## Rated data
drvModbusAsynConfigure("MPPT_3000",    "MPPT",     1,       4,     0x3000,   0x0009,   0,   30000, "MPPT")
drvModbusAsynConfigure("MPPT_300E",    "MPPT",     1,       4,     0x300E,   0x0001,   0,   30000, "MPPT")

 ## Real-time data
drvModbusAsynConfigure("MPPT_3100",    "MPPT",     1,       4,     0x3100,   0x0008,   5,   30000, "MPPT")
drvModbusAsynConfigure("MPPT_310C",    "MPPT",     1,       4,     0x310C,   0x0007,   0,   30000, "MPPT")
drvModbusAsynConfigure("MPPT_311A",    "MPPT",     1,       4,     0x311A,   0x0002,   0,   30000, "MPPT")
drvModbusAsynConfigure("MPPT_311D",    "MPPT",     1,       4,     0x311D,   0x0001,   0,   30000, "MPPT")

 ## Batt/char status
drvModbusAsynConfigure("MPPT_3200",    "MPPT",     1,       4,     0x3200,   0x0003,   0,   30000, "MPPT")

 ## Battery Stats
drvModbusAsynConfigure("MPPT_3300",    "MPPT",     1,       4,     0x3300,   0x0016,   0,   30000, "MPPT")
drvModbusAsynConfigure("MPPT_331A",    "MPPT",     1,       4,     0x331A,   0x0005,   0,   30000, "MPPT")

 ## Clock
drvModbusAsynConfigure("MPPT_9013",    "MPPT",     1,       3,     0x9013,   0x0003,   0,   30000, "MPPT")

 ## Controller Mode
drvModbusAsynConfigure("MPPT_ctm",     "MPPT",     1,       3,     0x903D,   0x0001,   0,   30000, "MPPT")

 ## Battery capacity
drvModbusAsynConfigure("MPPT_btc",     "MPPT",     1,       3,     0x9001,   0x0001,   0,   30000, "MPPT")

 ## Coils
drvModbusAsynConfigure("MPPT_cor",     "MPPT",     1,       1,     0x0002,   0x0001,   0,   30000, "MPPT")

 ## Day/Night
drvModbusAsynConfigure("MPPT_dnm",     "MPPT",     1,       2,     0x200C,   0x0001,   0,   30000, "MPPT")

 ## Enable all debugging on modbus server
#asynSetTraceMask("MPPT_btc",0,255)

 ## Dump up to 512 bytes in asynTrace
#asynSetTraceIOTruncateSize("MPPT_btc",0,512)

dbLoadTemplate("main.substitutions")

iocInit

dbpf MPPT:PollDelay.PREC 0
