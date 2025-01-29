# Top Brass Optimization Model for CS524



using HiGHS
using JuMP

TBmodel = Model()
set_optimizer(TBmodel, HiGHS.Optimizer)
@variable(TBmodel, 1000 >= fTroph >= 0, Int)
@variable(TBmodel, 1500 >= sTroph >= 0, Int)
@constraint(TBmodel, 4 * fTroph + 2 * sTroph <= 4800)
@constraint(TBmodel, fTroph + sTroph <= 1750)
@objective(TBmodel, Max, 12 * fTroph + 9 * sTroph)

optimize!(TBmodel)
println("Value of soccer trophies: ", value(sTroph))
println("Value of football trophies: ", value(fTroph))