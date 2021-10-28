local log = {}
log.level_enum = {
    debug = 1,
    info = 2,
    warn = 3,
    err = 4,
    none = 5,
}

log.level = "none"
log.trace = false

log.debug = function(...)
    if log.level_enum[log.level] <= log.level_enum["debug"] then
        print("[DEBUG]", ...)
    end
end

log.info = function(...)
    if log.level_enum[log.level] <= log.level_enum["info"] then
        print("[INFO ]", ...)
    end
end

log.warn = function(...)
    if log.level_enum[log.level] <= log.level_enum["warn"] then
        print("----------------------------------------------------------------------")
        print("[WARN ]", ...)
        if log.trace then
            print(debug.traceback())
        end
        print("----------------------------------------------------------------------")
    end
end

log.err = function(...)
    if log.level_enum[log.level] <= log.level_enum["err"] then
        print("----------------------------------------------------------------------")
        print("[ERR ]", ...)
        if log.trace then
            print(debug.traceback())
        end
        print("----------------------------------------------------------------------")
    end
end

return log
