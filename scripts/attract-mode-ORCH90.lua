print("registering callback");
emu.register_start(function()
    coroutine.resume(co)
end)

co = coroutine.create(function ()
    print("waiting to LOAD program")
    emu.wait(3);
    print("sending RUN\"MOD13.BAS\"\n")
    emu.keypost("RUN\"MOD13.BAS\"\n")
    print("waiting to select DRIVE 1")
    emu.wait(15);
    print("selecting DRIVE 1")
    emu.keypost("1");
    print("waiting to select MOD file A")
    emu.wait(10);
    print("selecting MOD file A")
    emu.keypost("A");
    resetcounter = 1
end)

if resetcounter == nil then
    print(coroutine.resume(co))
else
    print("Clear already done")
end

