
"Nearest interpolation type"
abstract type Nearest <: InterpMode end

function interp(xi::Vector{T}, yi::VecOrMat{T}, ::Type{Nearest};
                copy=true, sorted=false) where T
    _xi, _yi = _prepare_input(xi, yi, copy, sorted)

    function f(x)
        idx = _searchsortednearest(_xi, x)
        return ndims(_yi) == 1 ? _yi[idx] : _yi[:, idx]
    end
        
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


