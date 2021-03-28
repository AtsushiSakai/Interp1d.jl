
"Nearest interpolation type"
abstract type Nearest <: InterpMode end


"""
    interp(xi::Vector{T}, yi::Vector{T}, ::Type{Nearest}; copy=true, sorted=false) where T
    interp(xi::Vector{T}, yi::Matrix{T}, ::Type{Nearest}; copy=true, sorted=false) where T

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
function interp(xi::Vector{T}, yi::Vector{T}, ::Type{Nearest};
                copy=true, sorted=false) where T
    _xi, _yi = _prepare_input(xi, yi, copy, sorted)
    
    f(x) = _yi[_searchsortednearest(_xi, x)]
        
    return f
end

function interp(xi::Vector{T}, yi::Matrix{T}, ::Type{Nearest};
                copy=true, sorted=false) where T
    _xi, _yi = _prepare_input(xi, yi, copy, sorted)
    
    f(x) = _yi[:, _searchsortednearest(_xi, x)]
        
    return f
end

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

function _searchsortednearest(a,x)
   idx = searchsortedfirst(a,x)
   idx==1 && return idx
   idx>length(a) && return length(a)
   a[idx]==x && return idx
   if abs(a[idx]-x) < abs(a[idx-1]-x)
      return idx
   else
      return idx-1
   end
end


