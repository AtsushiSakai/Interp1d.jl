
"Nearest interpolation type"
abstract type Nearest <: InterpMode end


"""
    interp(xi::Vector{T}, yi::Vector{T}, ::Type{Nearest}) where T

Returns a nearest interpolation function `f(x)` based on interpolated points `xi` and `yi`.

# Examples
```jldoctest
julia> using Interp1d

julia> x = [-1.0, 0.0, 3.0/2.0];

julia> y = [2.0, 1.0, 3.0];

julia> f = interp(x, y, Nearest);

julia> f(1.0)
3.0
```

"""
function interp(xi::Vector{T}, yi::Vector{T}, ::Type{Nearest}) where T
    
    f(x) = yi[_searchsortednearest(xi, x)]
        
    return f
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


