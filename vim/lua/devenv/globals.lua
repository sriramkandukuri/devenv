_GlobalCallbacks = _GlobalCallbacks or {}
_G.HILG = {}

_G.globals = {_store = _GlobalCallbacks}
function globals._create(f)
  table.insert(globals._store, f)
  return #globals._store
end

function globals._execute(id, args)
  globals._store[id](args)
end

P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require("plenary.reload").reload_module(...)
end

R = function(name)
  RELOAD(name)
  return require(name)
end

vim.cmd([[
    command! PLD Redir lua P(package.loaded)
]])
