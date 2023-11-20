local foundCounter = 0

local function checkCapacity(periph)
  local periphItems = periph.items()
  if periphItems[1] then
    print("items found")
    return true
  end
  print("items not found")
  foundCounter = foundCounter + 1
  return false
end

local function energizerToChest(energizer, chest)
  local energizerItems = energizer.items()
  local energizerItem
  if checkCapacity(energizer) then
    energizerItems = energizerItems[1] or {}
    energizerItem = energizerItems["name"] or {}
    if energizerItem then
      energizer.pushItem(peripheral.getName(chest),  energizerItem)
    end
  end
end

local function chestToEnergizer(energizer, chest)
  if not checkCapacity(energizer) then
    for i = 1, chest.size() do
      local item = chest.getItemDetail(i)
      if item then
        print("Pushing item:" .. item.name .. " from chest to energizer")
        energizer.pullItem(peripheral.getName(chest), item.name, 1)
      end
    end
  end
end

while true do
  local energizer = peripheral.find("powah:energizing_orb")
  local chest = peripheral.find("minecraft:chest")
  chestToEnergizer(energizer, chest)
  energizerToChest(energizer, chest)
  os.sleep(4)
  if foundCounter == 10 then
    os.sleep(2000)
    foundCounter = 0
  end
end
