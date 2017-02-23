local Pokemon = {}
Pokemon.__index=Pokemon

--Initialize
function Pokemon:new(nbase)
  self=setmetatable({},Pokemon)
  self.base=nbase
  return self
end

--Update Stats
function Pokemon:update()
  local temp = Basetable[self.base]
  
  self.id = memory.readbyte(temp[1])
  self.name = Pokemon:update_name(self.base)
  self.curhp = memory.readbyte(temp[3])
  self.maxhp = memory.readbyte(temp[4])
  self.lvl = memory.readbyte(temp[5])
  return self
end

--Update name
function Pokemon:update_name(cnt)
  local temp_name = ""
  local sep = "%s" 
  local i=1
  
  while Basetable[cnt][2][i] ~= nil and memory.readbyte(Basetable[cnt][2][i])~= 80 and memory.readbyte(Basetable[cnt][2][i]) ~= 242 do 
    temp_name = temp_name .. Alphabet[(memory.readbyte(Basetable[cnt][2][i])-126)]
    i = i+1
  end
  
  return temp_name
end

--Get stat
function Pokemon:get_stat(set)
  if set == "poke_id" then return self.id
  elseif set == "poke_name" then return self.name
  elseif set == "poke_hp" then return self.hp
  elseif set == "poke_maxhp" then return self.maxhp
  elseif set == "poke_lvl" then return self.lvl
  else return
  end
end

--Get all stats (no id)
function Pokemon:get_stats_as_string()
  return self.name .. ", HP: " .. self.curhp .. "/" .. self.maxhp .. ", Lvl: " .. self.lvl
end

return Pokemon
