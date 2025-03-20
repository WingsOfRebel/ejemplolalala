# Instalar y cargar lpSolve si es necesario
# install.packages("lpSolve")
library(lpSolve)
library(matlib)

# Definir la matriz de restricciones y el vector b
A1 <- matrix(c(1, -2,
               5, -7), nrow = 2, byrow = TRUE)
b1 <- c(7, -5)

# Definir una función objetivo trivial (minimizar 0*x1 + 0*x2)
obj <- rep(0, 2)

# Resolver el problema con restricciones de igualdad
sol1 <- lp("min", obj, A1, rep("=", 2), b1)

# Mostrar la solución encontrada
print(sol1$solution)

#----------------------------------

# Definir la matriz de restricciones y el vector b
A2 <- matrix(c(3,   2,  -1,
               2,   2,  1/2,
               1,   4,  -1), nrow = 3, byrow = TRUE)
b2 <- c(1, -2, 0)

# Función objetivo trivial para 3 variables
obj2 <- rep(0, 3)

# Resolver el problema con restricciones de igualdad
sol2 <- lp("min", obj2, A2, rep("=", 3), b2)

# Mostrar la solución encontrada
print(sol2$solution)


#_-----------------------------
library(matlib)

a=matrix(c(1,-2,5,-7),nrow = 2,ncol=2)
b=c(7,-5)

showEqn(a,b)
Solve(a,b, verbose = F,fractions = TRUE)
plotEqn(a,b)
##############

a2=matrix(c(3,2,-1,2,2,1/2,1,4,-1),nrow = 3,ncol=3)
b2=c(1,-2,0)

showEqn(a2,b2)
Solve(a2,b2, verbose = T,fractions = F)
plotEqn3d(a2,b2)



#_______________________________
# Instalar y cargar ggplot2 si no lo tienes
# install.packages("ggplot2")
library(ggplot2)

# Definir las ecuaciones:
# Para la primera: x1 - 2x2 = 7  =>  x2 = (x1 - 7) / 2
# Para la segunda: 5x1 - 7x2 = -5 =>  x2 = (5x1 + 5) / 7

# Rango para x1
x1_vals <- seq(-10, 10, length.out = 400)

# Calcular x2 para cada ecuación
x2_eq1 <- (x1_vals - 7) / 2
x2_eq2 <- (5 * x1_vals + 5) / 7

# Encontrar la solución analítica (o extraída de lpSolve)
# Aquí se puede calcular la intersección resolviendo:
#   (x1 - 7)/2 = (5x1 + 5)/7  => 7*(x1 - 7) = 2*(5x1 + 5)
#   7x1 - 49 = 10x1 + 10  =>  -3x1 = 59  =>  x1 = -59/3
#   x2 = (-59/3 - 7)/2 = (-59/3 - 21/3)/2 = (-80/3)/2 = -40/3

sol_x1 <- -59/3
sol_x2 <- -40/3

# Crear un data frame para ggplot2
df1 <- data.frame(x1 = x1_vals, x2 = x2_eq1)
df2 <- data.frame(x1 = x1_vals, x2 = x2_eq2)

# Graficar
ggplot() +
  geom_line(data = df1, aes(x = x1, y = x2), color = "blue", size = 1, linetype = "dashed") +
  geom_line(data = df2, aes(x = x1, y = x2), color = "red", size = 1, linetype = "dotted") +
  geom_point(aes(x = sol_x1, y = sol_x2), color = "black", size = 3) +
  labs(title = "Gráfica del Sistema de Ecuaciones",
       x = expression(x[1]),
       y = expression(x[2])) +
  theme_minimal()

