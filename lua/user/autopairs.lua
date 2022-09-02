local npairsStaus, npairs = pcall(require,'nvim-autopairs')
if(npairsStaus == nil) then
  return
end
local ruleStatus, Rule = pcall(require,'nvim-autopairs.rule')
if(ruleStatus == nil) then
  return
end

local cmp_autopairs_status, cmp_autopairs = pcall(require,'nvim-autopairs.completion.cmp')
if(cmp_autopairs_status == nil) then return end
local cmpStatus, cmp = pcall(require,'cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))

local nvim_autopairs_status, nvim_autopairs = pcall(require,'nvim-autopairs')
if(nvim_autopairs_status == nil) then
  return
end
nvim_autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = {'string'},-- it will not add a pair on that treesitter node
        javascript = {'template_string'},
    }
})

local ts_conds_status, ts_conds = pcall(require, 'nvim-autopairs.ts-conds')
if(ts_conds_status == nil) then
  return
end


-- press % => %% only while inside a comment or string
npairs.add_rules({
  Rule("%", "%", "lua")
    :with_pair(ts_conds.is_ts_node({'string','comment'})),
  Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'}))
})