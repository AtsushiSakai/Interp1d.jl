module Interp1d

"""
    interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Nearest}; copy=true, sorted=false) where T
    interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Previous}; copy=true, sorted=false) where T

Returns a nearest interpolation function `f(x)` based on interpolated points `xi` and `yi`.

If `xi` has a duplicated value, `ArgumentError` is thrown.

If `copy` is true, this function makes internal copies of `xi` and `yi`, otherwise it uses references.

If `sorted` is false, this function sorts `xi` first, otherwise it assumes `xi` is monotonically increasing. 

# Examples
This is a simple interpolation example:
```jldoctest
julia> using Interp1d

julia> xi = [-1.0, 0.0, 3.0/2.0];

julia> yi = [2.0, 1.0, 3.0];

julia> f = interp(xi, yi, Nearest);

julia> f(1.0)
3.0
```

`yi` can be matrix for multi univerate interpolations.
The number of rows of `yi` must be equal to the length of `xi`.

```jldoctest
julia> using Interp1d

julia> xi = [-1.0, 0.0, 3.0/2.0];

julia> yi = [ 2.0  1.0 3.0;
             -1.0 -4.4 2.0];

julia> f = interp(xi, yi, Nearest);

julia> f(0.0)
2-element Vector{Float64}:
  1.0
 -4.4
```

"""
function interp end

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
