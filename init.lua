-- Yichang 2022-11-02 https://github.com/yichang

cfg={
   ssid="yourssid",
   pwd="yourpassword"
}

print('\n\nSetting up WIFI...')
wifi.setmode(wifi.STATION)
oldcfg=wifi.sta.getconfig(true)
if oldcfg ~= nil and oldcfg.ssid ~= "" then
   cfg = oldcfg
end
wifi.sta.config(cfg)
wifi.sta.connect()

t1 = tmr.create()
t1:alarm(1000, tmr.ALARM_AUTO, function()
   if wifi.sta.getip() == nil then
      print("Connecting to "..cfg.ssid)
   else
      t1:stop()
      print("Connected. IP: "..wifi.sta.getip())
      dofile("http.lua")
   end
end)
