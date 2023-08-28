PROJECT = "RN8302B"
VERSION = "0.0.1"
PRODUCT_KEY = ""

sys = require("sys")
sysplus = require("sysplus")

--spi编号和CS管脚，请按实际情况修改
local spiId = 0
local cs = 20
local cspin = gpio.setup(cs, 1)

--收发数据
local function sendRecv(data,len)
    local r = ""
    cspin(0)
    if data then spi.send(spiId,data) end
    if len then r = spi.recv(spiId,len) end
    cspin(1)
    return r
end

local function Task()

    log.info("Main Task",rtos.bsp(), "RN8302B")

    local result = spi.setup(spiId,cs,0,0,8,100000)
    print("open SPI",result)
    if result ~= 0 then--返回值为0，表示打开成功
        print("spi open error",result)
    else
        spi.close(spiId)
    end
    while true do
        sys.wait(10000)
    end

end

sys.taskInit(Task)

sys.run()
