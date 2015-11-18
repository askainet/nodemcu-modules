-- ***************************************************************************
-- NTP module for nodemcu firmware with NTP and RTCTIME support
-- ***************************************************************************

local moduleName = ...
local M = {}
_G[moduleName] = M

-- Sync rtctime using NTP
function M.sync(ntp_server1, ntp_server2='', verbose=0)
  -- Try first server
  sntp.sync(ntp_server1,
    function(sec, usec, server) -- on success
      if verbose == 1 then
        print('NTP sync with '..ntp_server1..' ok, setting RTC time to '..sec..'.'..usec)
      end,
    function() -- on failure
      if verbose == 1 then
        print('NTP sync with '..ntp_server1..' failed!')
      end
      -- Try second server
      if ntp_server2 ~= '' then
        sntp.sync(ntp_server2,
          function(sec, usec, server) -- on success
            if verbose == 1 then
              print('NTP sync with '..ntp_server2..' ok, setting RTC time to '..sec..'.'..usec)
            end,
          function() -- on failure
            if verbose == 1 then
              print('NTP sync with '..ntp_server2..' failed!')
            end
          end
        )
      end
    end
  )
end

return M