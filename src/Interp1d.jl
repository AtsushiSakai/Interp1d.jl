module Interp1d

# Interp mode
abstract type InterpMode end

include("Nearest.jl")

# export all public APIs
const _EXCLUDE_SYMBOLS = [Symbol(@__MODULE__), :eval, :include]
for sym in names(@__MODULE__, all = true)
    sym_string = string(sym)
    if sym in _EXCLUDE_SYMBOLS ||
       !Base.isidentifier(sym) ||
       startswith(sym_string, "_") ||
       startswith(sym_string, "@_")
        continue
    end
    @eval export $sym
end

end
