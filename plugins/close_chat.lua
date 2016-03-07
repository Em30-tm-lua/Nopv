local function run(msg, matches)
    if is_owner(msg) then
        return
    end
    local data = load_data(_config.moderation.data)
    if data[tostring(msg.to.id)] then
        if data[tostring(msg.to.id)]['settings'] then
            if data[tostring(msg.to.id)]['settings']['lock_talk'] then
                lock_talk = data[tostring(msg.to.id)]['settings']['lock_talk']
            end
        end
    end
 local talk_hash = 'antilink:'..msg.from.id..':'..msg.to.id
 local is_antilink_hash = redis:get(antilink_hash)
    local chat = get_receiver(msg)
    local user = "user#id"..msg.from.id
    if not is_talk_hash then
     if msg.to.type == 'channel' then  
     delete_msg(msg.id, ok_cb, false)
	  local antilink_hash = 'antilink:'..msg.from.id..':'..msg.to.id
      redis:set(antilink_hash, 0)
     return "Don't Send Group Link Here!!\nNext time You Will be Kicked!!"
     end
    elseif is_antilink_hash then
     if msg.to.type == 'channel' then  
     delete_msg(msg.id, ok_cb, false)
     redis:del(antilink_hash)
     channel_kick_user("channel#id"..msg.to.id, 'user#id'..msg.from.id, ok_cb, false)
     return "I told You :(  #Sorry_AnyWay"
     end
end
end
-- 
 
return {
  patterns = {
   "(.+)"
  },
  run = run
}

