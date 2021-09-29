export hs7

function hs7(; n::Int = default_nvar, type::Val{T} = Val(Float64), kwargs...) where {T}
  return ADNLPModels.ADNLPModel(
    x -> log(1 + x[1]^2) - x[2],
    T[2.0; 2.0],
    x -> [(1 + x[1]^2)^2 + x[2]^2 - 4],
    zeros(T, 1),
    zeros(T, 1),
    name = "hs7_autodiff";
    kwargs...,
  )
end

hs7_meta = Dict(
  :nvar => 2,
  :variable_size => false,
  :ncon => 1,
  :variable_con_size => false,
  :minimize => true,
  :name => "hs7",
  :optimal_value => NaN,
  :has_multiple_solution => missing,
  :is_infeasible => missing,
  :objtype => :other,
  :contype => :quadratic,
  :origin => :unknown,
  :deriv => typemax(UInt8),
  :not_everywhere_defined => false,
  :has_cvx_obj => false,
  :has_cvx_con => false,
  :has_equalities_only => true,
  :has_inequalities_only => false,
  :has_bounds => false,
  :has_fixed_variables => false,
  :cqs => 0,
)

get_hs7_meta(; n::Integer = default_nvar) = (hs7_meta[:nvar], hs7_meta[:ncon])
