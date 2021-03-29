module Interp1d

# Interp mode
abstract type InterpMode end

function _prepare_input(xi, yi, copy, sorted)

    # check duplicate in xi
    length(xi) != length(unique(xi)) && throw(ArgumentError("xi has duplicated value: $xi"))

    _xi, _yi = copy ? (deepcopy(xi), deepcopy(yi)) : (xi, yi)

    if !sorted
        idxs = sortperm(_xi)
        _xi = view(_xi, idxs)
        _yi = ndims(_yi) == 1 ? view(_yi, idxs) : view(_yi, :, idxs)
    end

    return _xi, _yi
end


include("Nearest.jl")
include("Previous.jl")

# Supported Interpolation mode list
const INTERP_MODE_LIST = [Nearest, Previous]

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
