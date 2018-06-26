local ignored_types = {
  "entity-ghost"
}

local function handle_built_event(event)
  for i,t in ipairs(ignored_types) do
    if event.created_entity.type == t then
      game.print("skipping: " .. t);
      return
    end
  end

  event.created_entity.minable = false;
end

script.on_event(defines.events.on_built_entity,       handle_built_event)
script.on_event(defines.events.on_robot_built_entity, handle_built_event)
