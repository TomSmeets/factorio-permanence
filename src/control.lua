-- control.lua - Make all placed entities permanent
-- Copyright 2024 Tom Smeets <tom@tsmeets.nl>

-- These entitles are still minable, everything else is not minable
local ignored_types = {
  "entity-ghost"
}

local function handle_built_event(event)
  -- skip if the type is ignored
  for i,t in ipairs(ignored_types) do
    if event.entity.type == t then
      return
    end
  end

  -- tell Factorio that the tile cannot be mined
  event.entity.minable = false;
end

-- handle both player and robot built entities
script.on_event(defines.events.on_built_entity,       handle_built_event)
script.on_event(defines.events.on_robot_built_entity, handle_built_event)
