require "./inc/data"
Basetable = generate_Basetable()
Alphabet = generate_Alphabet()

local Pokemon = require "./inc/pokemon"

Party={}

--Sleep n seconds
function sleep(n)
  local  clock = os.clock
  local t0 = clock()
  
  while clock() - t0 <= n do 
  --print(t0 .. " " .. clock())
  emu.frameadvance() 
  end
end

--Check party count
function get_count()
  return memory.readbyte(0xDCD7)
end

--Save stats to file
function save_stats(stats)
  file = io.open("./out/stats.txt","w")
  file:write(stats)
  file:close()
end


--START
function start()
  --Initialize
  for i=1,6 do
    Party[i] = Pokemon:new(i)
  end
  
  while true do
  
    local i=1;
    local current_stats=""
    
    while i<=get_count() do
    
      Party[i]:update()
      
      current_stats = current_stats .. Party[i]:get_stats_as_string() .."\n"
      print(current_stats)
      save_stats(current_stats)
      
      i=i+1
      
    end
    sleep(1)
  end
end

start()
