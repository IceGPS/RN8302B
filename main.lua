
-- LuaTools需要PROJECT和VERSION这两个信息
PROJECT = "RN8302B"
VERSION = "0.0.1"
-- OTA 必须有产品KEY
PRODUCT_KEY = ""

-- 引入必要的库文件(lua编写), 内部库不需要require，但是sys必须require
sys = require("sys")
sysplus = require("sysplus")

----------------------------------------
-- 报错信息自动上报到平台,默认是iot.openluat.com
-- 支持自定义, 详细配置请查阅API手册
-- 开启后会上报开机原因, 这需要消耗流量,请留意
if errDump then
    --errDump.config(true, 600)
end
----------------------------------------


function read8302()


end


function Task()
    log.info("Main Task", "RN8302B")

    while true do
        sys.wait(10000)
    end
end

sys.taskInit(Task)

sys.run()
