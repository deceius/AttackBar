local pont = 0.000
local pofft = 0.000
local ont = 0.000
local offt = 0.000
local ons = 0.000
local offs = 0.000
local offh = 0
local onh = 0
local eons = 0.000
local eoffs = 0.000
local tons = 0.000
local QUEUE_WINDOW = 0.4

if not(AttackBarDB) then AttackBarDB = { } end

function Abar_loaded()
  SlashCmdList["ATKBAR"] = Abar_chat;
  SLASH_ATKBAR1 = "/abar";
  SLASH_ATKBAR2 = "/atkbar";

  if AttackBarDB.range == nil then AttackBarDB.range = true end
  if AttackBarDB.melee == nil then AttackBarDB.melee = true end
  if AttackBarDB.timer == nil then AttackBarDB.timer = true end
  if AttackBarDB.mob == nil then AttackBarDB.mob = true end
  if AttackBarDB.pvp == nil then AttackBarDB.pvp = true end
  if AttackBarDB.enemy == nil then AttackBarDB.enemy = true end
  if AttackBarDB.text == nil then AttackBarDB.pvp = "standard" end
  if AttackBarDB.r == nil then AttackBarDB.r = 0 end
  if AttackBarDB.g == nil then AttackBarDB.g = 0 end
  if AttackBarDB.b == nil then AttackBarDB.b = 1 end

  Abar_Mhr:SetPoint("LEFT", Abar_Frame, "TOPLEFT", 6, -13)
  Abar_Oh:SetPoint("LEFT", Abar_Frame, "TOPLEFT", 6, -35)
  Abar_MhrText:SetJustifyH("RIGHT")
  Abar_MhrTmr:SetJustifyH("LEFT")
  Abar_OhText:SetJustifyH("RIGHT")
  Abar_OhTmr:SetJustifyH("LEFT")
  
  ebar_VL()
  local Border = "Border"
  local Bordern = "Bordern"

  if AttackBarDB.text == "thin" then
    getglobal(Abar_Mhr:GetName() .. Border):Hide()
    getglobal(Abar_Oh:GetName() .. Border):Hide()
    getglobal(ebar_mh:GetName() .. Border):Hide()
    getglobal(ebar_oh:GetName() .. Border):Hide()
    getglobal(Abar_Mhr:GetName() .. Bordern):Show()
    getglobal(Abar_Oh:GetName() .. Bordern):Show()
    getglobal(ebar_mh:GetName() .. Bordern):Show()
    getglobal(ebar_oh:GetName() .. Bordern):Show()
  elseif AttackBarDB.text == "none" then
    getglobal(Abar_Mhr:GetName() .. Bordern):Hide()
    getglobal(Abar_Oh:GetName() .. Bordern):Hide()
    getglobal(ebar_mh:GetName() .. Bordern):Hide()
    getglobal(ebar_oh:GetName() .. Bordern):Hide()
    getglobal(Abar_Mhr:GetName() .. Border):Hide()
    getglobal(Abar_Oh:GetName() .. Border):Hide()
    getglobal(ebar_mh:GetName() .. Border):Hide()
    getglobal(ebar_oh:GetName() .. Border):Hide()
  else
    AttackBarDB.text = "standard"
    getglobal(Abar_Mhr:GetName() .. Bordern):Hide()
    getglobal(Abar_Oh:GetName() .. Bordern):Hide()
    getglobal(ebar_mh:GetName() .. Bordern):Hide()
    getglobal(ebar_oh:GetName() .. Bordern):Hide()
    getglobal(Abar_Mhr:GetName() .. Border):Show()
    getglobal(Abar_Oh:GetName() .. Border):Show()
    getglobal(ebar_mh:GetName() .. Border):Show()
    getglobal(ebar_oh:GetName() .. Border):Show()
  end
end

function Abar_chat(msg)
  msg = strlower(msg)
  if msg == "fix" then
    Abar_reset()
  elseif msg == "lock" then
    Abar_Frame:Hide()
    ebar_Frame:Hide()
  elseif msg == "unlock" then
    Abar_Frame:Show()
    ebar_Frame:Show()
  elseif msg == "enemy" then
    AttackBarDB.enemy = not(AttackBarDB.enemy)
    DEFAULT_CHAT_FRAME:AddMessage('show enemy bar is ' .. Abar_Boo(AttackBarDB.enemy));
  elseif msg == "debug" then
    AttackBarDB.debug = not(AttackBarDB.debug)
    DEFAULT_CHAT_FRAME:AddMessage('debug is ' .. Abar_Boo(AttackBarDB.debug));
  elseif msg == "range" then
    AttackBarDB.range = not(AttackBarDB.range)
    DEFAULT_CHAT_FRAME:AddMessage('range is ' .. Abar_Boo(AttackBarDB.range));
  elseif msg == "melee" then
    AttackBarDB.melee = not(AttackBarDB.melee)
    DEFAULT_CHAT_FRAME:AddMessage('melee is ' .. Abar_Boo(AttackBarDB.melee));
  elseif msg == "timer" then
    AttackBarDB.timer = not(AttackBarDB.timer)
    DEFAULT_CHAT_FRAME:AddMessage('timer is ' .. Abar_Boo(AttackBarDB.timer));
  elseif msg == "pvp" then
    AttackBarDB.pvp = not(AttackBarDB.pvp)
    DEFAULT_CHAT_FRAME:AddMessage('pvp is ' .. Abar_Boo(AttackBarDB.pvp));
  elseif msg == "text" then
    local Border = "Border"
    local Bordern = "Bordern"
    if AttackBarDB.text == "standard" then
      AttackBarDB.text = "thin"
      getglobal(Abar_Mhr:GetName() .. Border):Hide()
      getglobal(Abar_Oh:GetName() .. Border):Hide()
      getglobal(ebar_mh:GetName() .. Border):Hide()
      getglobal(ebar_oh:GetName() .. Border):Hide()
      getglobal(Abar_Mhr:GetName() .. Bordern):Show()
      getglobal(Abar_Oh:GetName() .. Bordern):Show()
      getglobal(ebar_mh:GetName() .. Bordern):Show()
      getglobal(ebar_oh:GetName() .. Bordern):Show()
    elseif AttackBarDB.text == "thin" then
      AttackBarDB.text = "none"
      getglobal(Abar_Mhr:GetName() .. Bordern):Hide()
      getglobal(Abar_Oh:GetName() .. Bordern):Hide()
      getglobal(ebar_mh:GetName() .. Bordern):Hide()
      getglobal(ebar_oh:GetName() .. Bordern):Hide()
      getglobal(Abar_Mhr:GetName() .. Border):Hide()
      getglobal(Abar_Oh:GetName() .. Border):Hide()
      getglobal(ebar_mh:GetName() .. Border):Hide()
      getglobal(ebar_oh:GetName() .. Border):Hide()
    else
      AttackBarDB.text = "standard"
      getglobal(Abar_Mhr:GetName() .. Bordern):Hide()
      getglobal(Abar_Oh:GetName() .. Bordern):Hide()
      getglobal(ebar_mh:GetName() .. Bordern):Hide()
      getglobal(ebar_oh:GetName() .. Bordern):Hide()
      getglobal(Abar_Mhr:GetName() .. Border):Show()
      getglobal(Abar_Oh:GetName() .. Border):Show()
      getglobal(ebar_mh:GetName() .. Border):Show()
      getglobal(ebar_oh:GetName() .. Border):Show()
    end
    DEFAULT_CHAT_FRAME:AddMessage("Attack bar textures are " .. AttackBarDB.text)

  elseif msg == "mob" then
    AttackBarDB.mob = not(AttackBarDB.mob)
    DEFAULT_CHAT_FRAME:AddMessage('mobs are ' .. Abar_Boo(AttackBarDB.mob));

  elseif msg == "color" then
    ColorPickerFrame:SetColorRGB(AttackBarDB.r, AttackBarDB.g, AttackBarDB.b);
    ColorPickerFrame.hasOpacity = nil;
    ColorPickerFrame.previousValues = {AttackBarDB.r, AttackBarDB.g, AttackBarDB.b, 1};
    ColorPickerFrame.func = changeBarColor; 
    ColorPickerFrame.cancelFunc = changeBarColor;
    ColorPickerFrame:Hide();
    ColorPickerFrame:Show();

  else
    DEFAULT_CHAT_FRAME:AddMessage('Abar options:');
    DEFAULT_CHAT_FRAME:AddMessage('~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~');
    DEFAULT_CHAT_FRAME:AddMessage('unlock - to unlock and show the anchor');
    DEFAULT_CHAT_FRAME:AddMessage('lock - to lock and hide the anchor');
    DEFAULT_CHAT_FRAME:AddMessage('melee - to turn on and off the melee bar(s)');
    DEFAULT_CHAT_FRAME:AddMessage('range - to turn on and off the ranged bar');
    DEFAULT_CHAT_FRAME:AddMessage('pvp - to turn on and off the enemy player bar(s)');
    DEFAULT_CHAT_FRAME:AddMessage('mob - to turn on and off the enemy mob bar(s)');
    DEFAULT_CHAT_FRAME:AddMessage('text - toggle from standard to line to no texture');
    DEFAULT_CHAT_FRAME:AddMessage('color - change the background color of the bar');
    DEFAULT_CHAT_FRAME:AddMessage('fix - to reset the values should they go awry,'); 
    DEFAULT_CHAT_FRAME:AddMessage('      wait 5 sec after attacking to use this command');
  end
end

function Abar_reset()
  pont = 0.000
  pofft = 0.000
  ont = 0.000
  offt = 0.000
  local onid = 0
  local offid = 0
end
function clearBars()
    Abar_Mhr:Hide()
    Abar_Oh:Hide()
    ebar_mh:Hide()
    ebar_oh:Hide()
end

function Abar_event(event)
  if AttackBarDB.debug then DEFAULT_CHAT_FRAME:AddMessage("Event Triggered: " .. event) end
  if event == "PLAYER_TARGET_CHANGED" then
    Abar_reset()
    clearBars()
  end

  if AttackBarDB.melee == true then
    
    if (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES") or 
        (event == "CHAT_MSG_SPELL_CREATURE_VS_SELF_DAMAGE") or 
        (event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES") or 
        (event == "CHAT_MSG_SPELL_HOSTILEPLAYER_DAMAGE") then
		  if string.find(arg1, "You parry") then
        DEFAULT_CHAT_FRAME:AddMessage("Parry Haste Triggered!")
        Abar_ParryHaste()
       end
    end

    if (event == "CHAT_MSG_COMBAT_SELF_MISSES" or event == "CHAT_MSG_COMBAT_SELF_HITS") and arg1 then
        Abar_selfhit(arg1)
    end
  end

  if event == "PLAYER_LEAVE_COMBAT" or event == "PLAYER_REGEN_ENABLED" then Abar_reset() end
  if event == "VARIABLES_LOADED" then Abar_loaded() end
  if event == "CHAT_MSG_SPELL_SELF_DAMAGE" then 
    Abar_spellhit(arg1) 
  end
  if event == "UNIT_SPELLCAST_SENT" then 
    abar_spelldir(arg2) 
  end
end

function changeBarColor(restore)
    if not restore then
        AttackBarDB.r, AttackBarDB.g, AttackBarDB.b = ColorPickerFrame:GetColorRGB();
    end
end

-----------------------------------------------------------------------------------------------------------------------
-- PLAYER BAR CODE --
-----------------------------------------------------------------------------------------------------------------------

function Abar_selfhit(arg1)

  local a, b, spell = string.find(arg1, "Your (.+) hits")

  if not spell then a, b, spell = string.find(arg1, "Your (.+) crits") end
  if not spell then a, b, spell = string.find(arg1, "Your (.+) is") end
  if not spell then a, b, spell = string.find(arg1, "Your (.+) misses") end

  if spell then 
    Abar_spellhit(spell)
  else
    Abar_meleeHit()
  end
end

function Abar_ParryHaste()
    local now = GetTime()
    -- Only affect the Main Hand bar if it is currently visible/active
    if Abar_Mhr:IsVisible() and Abar_Mhr.et then
        local mhSpeed, _ = UnitAttackSpeed("player")
        local remaining = Abar_Mhr.et - now
        
        if remaining > 0 then
            local reduction = mhSpeed * 0.4
            local minRemaining = mhSpeed * 0.2
            
            -- New remaining time cannot be less than 20% of weapon speed
            local newRemaining = remaining - reduction
            if newRemaining < minRemaining then
                newRemaining = minRemaining
            end
            
            -- Adjust the end time
            Abar_Mhr.et = now + newRemaining
            -- Update the status bar range so the "spark" moves correctly
            Abar_Mhr:SetMinMaxValues(Abar_Mhr.st, Abar_Mhr.et)
            
            -- Update the internal tracking variable 'pont' 
            -- so the next swing calculation stays in sync
            pont = Abar_Mhr.et - mhSpeed
        end
    end
end

function Abar_meleeHit()

    if isTargetDeadOrNotValid() then
      clearBars() 
      return
    end

    local mhSpeed, ohSpeed = UnitAttackSpeed("player")
    local now = GetTime()

    local mhNext = pont + mhSpeed
    local ohNext = pofft + (ohSpeed or 0)

    -- determine which swing actually fired
    if ohSpeed and math.abs(now - ohNext) < math.abs(now - mhNext) then
        -- OFFHAND
        pofft = now
        ohSpeed = ohSpeed - math.mod(ohSpeed, 0.01)
        Abar_Ohs(ohSpeed, "["..ohSpeed.."] ", AttackBarDB.r, AttackBarDB.g, AttackBarDB.b)

    else
        -- MAINHAND
        pont = now
        mhSpeed = mhSpeed - math.mod(mhSpeed, 0.01)
        Abar_Mhrs(mhSpeed, "["..mhSpeed.."] ", AttackBarDB.r, AttackBarDB.g, AttackBarDB.b)

    end
end

function Abar_spellhit(arg1)

  if isTargetDeadOrNotValid() then
      return
  end

  local a, b, spell = string.find(arg1, "Your (.+) hits")
  if not spell then a, b, spell = string.find(arg1, "Your (.+) crits") end
  if not spell then a, b, spell = string.find(arg1, "Your (.+) is") end
  if not spell then a, b, spell = string.find(arg1, "Your (.+) misses") end
  if not spell then spell = arg1 end

  local rs, rhd, rld = UnitRangedDamage("player");
  local trs

  if spell == "Auto Shot" and AttackBarDB.range == true then
    trs = rs
    rs = rs - math.mod(rs, 0.01)
    Abar_Mhrs(trs, "Auto Shot [" .. rs .. "s]", 0, 1, 0)
  elseif spell == "Shoot" and AttackBarDB.range == true then
    trs = rs
    rs = rs - math.mod(rs, 0.01)
    Abar_Mhrs(trs, "Wand [" .. ons .. "s]", .7, .1, 1)
  elseif (spell == "Raptor Strike" or spell == "Heroic Strike" or
          spell == "Maul" or spell == "Cleave")
         and AttackBarDB.melee == true then
    Abar_meleeHit()
  end
end

function abar_spelldir(spellname)
  if AttackBarDB.range then
    local a, b, sparse = string.find(spellname, "(.+)%(")
    if sparse then spellname = sparse end
    local rs, rhd, rld = UnitRangedDamage("player");
    local trs

    if spellname == "Throw" then
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Thrown [" ..(rs) .. "s]", 1, .5, 0)
    elseif spellname == "Shoot" then
      rs = UnitRangedDamage("player")
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Range [" ..(rs) .. "s]", .5, 0, 1)
    elseif spellname == "Shoot Bow" then
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Bow [" ..(rs) .. "s]", 1, .5, 0)
    elseif spellname == "Shoot Gun" then
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Gun [" ..(rs) .. "s]", 1, .5, 0)
    elseif spellname == "Shoot Crossbow" then
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Crossbow [" ..(rs) .. "s]", 1, .5, 0)
    elseif spellname == "Aimed Shot" then
      trs = rs
      rs = rs - math.mod(rs, 0.01)
      Abar_Mhrs(trs - 1, "Aiming [" ..(3) .. "s]", 1, .1, .1)
    end
  end
end
  
function Abar_Update()

  if not UnitExists("target") or UnitIsDeadOrGhost("target") then
    Abar_reset()
    Abar_Mhr:Hide()
    Abar_Oh:Hide()
    ebar_mh:Hide()
    ebar_oh:Hide()
    return
  end

  local now = GetTime()
  local left = this.et - now
  left = math.max(left, 0)

  local tSpark = getglobal(this:GetName() .. "Spark")
  local tText = getglobal(this:GetName() .. "Tmr")

-- HEROIC STRIKE QUEUE WINDOW (dual-color)
if this == Abar_Mhr then -- only mainhand
    if left <= QUEUE_WINDOW then
        this:SetStatusBarColor(1, 0, 0)           -- red: queue now
    elseif left <= QUEUE_WINDOW + 0.4 then
        this:SetStatusBarColor(1, 0.6, 0)         -- orange: pre-queue warning
    else
        this:SetStatusBarColor(AttackBarDB.r, AttackBarDB.g, AttackBarDB.b) -- normal
    end
else
    this:SetStatusBarColor(AttackBarDB.r, AttackBarDB.g, AttackBarDB.b) -- offhand stays normal
end

  if AttackBarDB.timer == true then
    local display = math.floor(left * 10) / 10
    tText:SetText(display)
    tText:Show()
  else
    tText:Hide()
  end

  this:SetValue(now)
  tSpark:SetPoint("CENTER", this, "LEFT",(now - this.st) /(this.et - this.st) * 195, 2);

  if now >= this.et then
    this:Hide()
    tSpark:SetPoint("CENTER", this, "LEFT", 195, 2);
  end
end

function Abar_Mhrs(bartime, text, r, g, b)
  Abar_Mhr:Hide()
  Abar_Mhr.txt = text
  Abar_Mhr.st = GetTime()
  Abar_Mhr.et = GetTime() + bartime
  Abar_Mhr:SetStatusBarColor(r, g, b)
  Abar_MhrText:SetText(text)
  Abar_Mhr:SetMinMaxValues(Abar_Mhr.st, Abar_Mhr.et)
  Abar_Mhr:SetValue(Abar_Mhr.st)
  if Abar_Oh:IsVisible() then
    Abar_Mhr:SetPoint("LEFT", Abar_Frame, "TOPLEFT", 6, -35)
  else
    Abar_Mhr:SetPoint("LEFT", Abar_Frame, "TOPLEFT", 6, -13)
  end
  Abar_Mhr:Show()
end

function Abar_Ohs(bartime, text, r, g, b)
  Abar_Oh:Hide()
  Abar_Oh.txt = text
  Abar_Oh.st = GetTime()
  Abar_Oh.et = GetTime() + bartime
  Abar_Oh:SetStatusBarColor(r, g, b)
  Abar_OhText:SetText(text)
  Abar_Oh:SetMinMaxValues(Abar_Oh.st, Abar_Oh.et)
  Abar_Oh:SetValue(Abar_Oh.st)
  Abar_Oh:Show()
end

function Abar_Boo(inpt)
  if inpt == true then return "ON" else return "OFF" end
end

-----------------------------------------------------------------------------------------------------------------------
-- ENEMY BAR CODE --
-----------------------------------------------------------------------------------------------------------------------

function ebar_VL()
  ebar_mh:SetPoint("LEFT", ebar_Frame, "TOPLEFT", 6, -13)
  ebar_oh:SetPoint("LEFT", ebar_Frame, "TOPLEFT", 6, -35)
  ebar_mhText:SetJustifyH("Left")
  ebar_mhTmr:SetJustifyH("Left")
  ebar_ohText:SetJustifyH("Left")
  ebar_ohTmr:SetJustifyH("Left")
end

function ebar_event(event)
  if not AttackBarDB.enemy then return end
  if event == "VARIABLES_LOADED" then
    ebar_VL()
  end
  if (event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_HITS" or event == "CHAT_MSG_COMBAT_CREATURE_VS_SELF_MISSES") and AttackBarDB.mob == true then
    ebar_start(arg1)
  elseif (event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_HITS" or event == "CHAT_MSG_COMBAT_HOSTILEPLAYER_MISSES") and AttackBarDB.pvp == true then
    ebar_start(arg1)
  end
end

function ebar_start(arg1)

  if isTargetDeadOrNotValid() then
    clearBars()
    return
  end

  local a
  local b
  local hitter = nil
  a, b, hitter = string.find(arg1, "(.+) hits you")
  if not hitter then a, b, hitter = string.find(arg1, "(.+) crits you") end
  if not hitter then a, b, hitter = string.find(arg1, "(.+) misses you") end
  if not hitter then a, b, hitter = string.find(arg1, "(.+) attacks. You ") end
  if hitter == UnitName("target") then ebar_set(hitter) end
end

function ebar_set(targ)
  eons, eoffs = UnitAttackSpeed("target")
  eons = eons - math.mod(eons, 0.01)
  ebar_mhs(eons, "[" .. eons .. "s]", 1, .1, .1)
end

function ebar_mhs(bartime, text, r, g, b)
  ebar_mh:Hide()
  ebar_mh.txt = text
  ebar_mh.st = GetTime()
  ebar_mh.et = GetTime() + bartime
  ebar_mh:SetStatusBarColor(r, g, b)
  ebar_mhText:SetText(text)
  ebar_mh:SetMinMaxValues(ebar_mh.st, ebar_mh.et)
  ebar_mh:SetValue(ebar_mh.st)
  ebar_mh:Show()
end

function ebar_ohs(bartime, text, r, g, b)
  ebar_oh:Hide()
  ebar_oh.txt = text
  ebar_oh.st = GetTime()
  ebar_oh.et = GetTime() + bartime
  ebar_oh:SetStatusBarColor(r, g, b)
  ebar_ohText:SetText(text)
  ebar_oh:SetMinMaxValues(ebar_oh.st, ebar_oh.et)
  ebar_oh:SetValue(ebar_oh.st)
  ebar_oh:Show()
end


function isTargetDeadOrNotValid()
  return UnitExists("target") and UnitIsDeadOrGhost("target")
end