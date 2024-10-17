local function telescope_setup()

end

xpcall(telescope_setup, function() print("setup of telescope failed!") end)
