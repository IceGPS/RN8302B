PROJECT = "RN8302B"
VERSION = "0.0.1"
PRODUCT_KEY = ""

sys = require("sys")
sysplus = require("sysplus")

local rtos_bsp = rtos.bsp()
local spi_id, spi_cs_pin = 0, 0


-- 自动适配Air101/103/601/105/S3/C3/EC618等开发板的SPI接口
-- 返回值：spi_id,spi_cs_pin
local function spi_pin()     
    if rtos_bsp == "AIR101" then
        return 0,pin.PB04
    elseif rtos_bsp == "AIR103" or rtos_bsp == "AIR601" then
        return 0,pin.PB04
    elseif rtos_bsp == "AIR105" then
        return 2,pin.PB03
    elseif rtos_bsp == "ESP32C3" then
        return 2,7
    elseif rtos_bsp == "ESP32S3" then
        return 2,14
    elseif rtos_bsp == "EC618" then
        return 0,8
    else
        log.info("main", "bsp not support")
        return
    end
end



--收发数据
local function sendRecv(data,len)
    local r = ""
    spi_cs_pin(0)
    if data then spi.send(spi_id,data) end
    if len then r = spi.recv(spi_id,len) end
    spi_cs_pin(1)
    return r
end

local function Task()

    log.info("Main Task",rtos_bsp, "RN8302B")
    spi_id,spi_cs_pin = spi_pin() 
    if spi_id ~= nil and spi_cs_pin ~= nil then
        local result = spi.setup(spi_id,spi_cs_pin,0,0,8,100000)
        print("open SPI",result)
        if result ~= 0 then--返回值为0，表示打开成功
            print("spi open error",result)
        else
            spi.close(spi_id)
        end
    end
    while true do
        sys.wait(10000)
    end

end

sys.taskInit(Task)

sys.run()
